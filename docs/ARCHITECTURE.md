# Architecture, Decisions and Pitfalls

This document is the authoritative design reference for Tholian Firewall. It
covers the architecture, the design decisions we made (and why), and the
implementation pitfalls we hit so they are not repeated.

---

## 1. Purpose

A programmable eBPF firewall for Go backends and a standalone CLI. It filters
network traffic before it reaches the kernel networking stack, with an
`iptables`/`hosts` fallback for platforms without eBPF.

Non-goals for the current milestone:

- No egress enforcement (XDP is ingress-only; see D3).
- No allowlist or default-deny mode (ban-only; see D2).
- No persistent state across process restarts (maps/links are not pinned; D10).

---

## 2. Repository layout

```
ebpf/                          Kernel-space eBPF module (C)
  headers/                     Vendored libbpf helper headers
  module/module.c              XDP program + BPF maps
  module/module.h              Packet/DNS parsing helpers
  module/module.ll             Generated LLVM IR (committed)

source/                        Go user space
  cmds/tholian-firewall/       CLI entrypoint
  actions/                     Forbid/Permit/Check/Search/Init/Load/Status
  adapters/mitigations/
    ebpf/                      cilium/ebpf bridge
      module/                  Map helpers + embedded bytecode
    iptables/                  iptables/ip6tables fallback
    hosts/                     /etc/hosts fallback (domains)
  console/                     Colored output + message log
  insights/                    Embedded "map of the internet" (ASN/subnet data)
  matchers/                    Parsed user input (Network/Connection/Subnet)
  structs/                     Rich models (Internet/Network/Subnet)
  types/                       Primitive types (IPv4/IPv6/Domain/ASN/...)
  tests/                       Integration tests compiled with `go test -c`
  utils/                       Kernel capability detection

docs/                          This documentation
make.sh, test.sh               Build and test entrypoints
```

---

## 3. Runtime data flow

```
CLI args -> main.go -> actions.* -> matchers/types/structs

... which controls either of ...

adapters/mitigations/ebpf (cilium bridge, BPF maps)
-> calls the ebpf/module (bytecode)
-> calls the XDP program in kernel

... or ...

adapters/mitigations/iptables
adapters/mitigations/hosts
```

1. CLI (`cmds/tholian-firewall/main.go`) parses arguments and dispatches.
2. Actions (`actions/`) build matchers and select a backend.
3. Network actions resolve ASN/subnet targets against `insights.Internet`.
4. eBPF bridge (`adapters/mitigations/ebpf/`) loads the embedded program and writes/deletes map keys.
5. Kernel XDP program (`ebpf/module`) inspects ingress packets and drops matches.

---

## 4. eBPF kernel module

### 4.1 Program

One XDP program, `xdp_prog_main` (`SEC("xdp")`). On ingress it parses:

- Ethernet + up to `VLAN_MAX_DEPTH` (4) VLAN tags,
- IPv4 (variable IHL) or IPv6 (up to `IPV6EXT_MAX_DEPTH` (6) extension headers),
- TCP / UDP / ICMP / ICMPv6,
- UDP DNS when `ENABLE_DNSFILTER` is defined.

It returns `XDP_DROP` for matches and `XDP_PASS` otherwise. Parse failures fail
**open** (pass) except for truncated headers, where it also passes.

### 4.2 BPF map schema

BTF map definitions are the canonical schema. The Go helpers **must** produce
keys of exactly the matching size/order.

| Map             | Type       | Key                                   | Value  | Flags               |
|-----------------|------------|---------------------------------------|--------|---------------------|
| `domain_bans`   | `HASH`     | `__u64` FNV-1a hash                   | `__u8` |                     |
| `ipv4_bans`     | `LPM_TRIE` | `{u32 prefixlen; u8 addr[4]}` (8 B)   | `__u8` | `BPF_F_NO_PREALLOC` |
| `ipv4_warnings` | `LRU_HASH` | `{u32 prefixlen; u8 addr[4]}`         | `__u8` |                     |
| `ipv6_bans`     | `LPM_TRIE` | `{u32 prefixlen; u8 addr[16]}` (20 B) | `__u8` | `BPF_F_NO_PREALLOC` |
| `ipv6_warnings` | `LRU_HASH` | `{u32 prefixlen; u8 addr[16]}`        | `__u8` |                     |
| `port_bans`     | `HASH`     | `__u16` network order (2 B)           | `__u8` |                     |

LPM-trie rules:

- `prefixlen` is **host byte order** (`binary.NativeEndian` in Go).
- The address bytes are **network byte order** (big endian).
- `BPF_F_NO_PREALLOC` is required to allow updates from the BPF program itself.

### 4.3 Ban semantics

- A `__u8` value of `1` means banned. `0` means present-but-unbanned; the
  readers dereference the value (`*banned != 0`).
- `permit` deletes the key; there is no allowlist (D2).
- A banned port blocks both source and destination port matches.
- A banned address blocks packets whose source **or** destination matches
  (LPM longest-prefix match, so a `/24` ban covers a `/32` lookup).

### 4.4 ICMP policy

- IPv4: pass echo (0/8), destination-unreachable (3), redirect (5),
  time-exceeded (11), parameter-problem (12); drop reserved types.
- IPv6: **pass** NDP (133-137) and echo (128/129). Dropping NDP breaks IPv6.

### 4.5 DNS filtering (kernel side)

`filter_dns` (`module.c`) is intentionally tiny:

```
if (!response || q_count == 0)            -> pass
hash = dns_hash_wire(question_name)       -> single flat loop, <= 128 bytes
drop if is_domain_banned(hash)
```

- Only **UDP** DNS is inspected (ports 53 and 5353). DoT (853) is encrypted;
  only port filtering applies. DNS-over-TCP is passed through.
- The question name is hashed with FNV-1a 64 over the lowercased **wire form**
  (`<len>label...0`). See D6.
- **Compression pointers are never followed.** A pointer terminates parsing.
- This is a *drop-only* filter. Installing resolved A/AAAA is done in user
  space (see D5), because in-BPF answer parsing could not satisfy the
  verifier (see P6-P9).

### 4.6 Domain key hashing

Kernel (`module.h:dns_hash_wire`) and user space (`module/ToBPFDomain.go`) MUST
agree. Both hash the lowercased wire form:

```
"evil.example" -> 04 'e' 'v' 'i' 'l' 07 'e' 'x' 'a' 'm' 'p' 'l' 'e' 00
                  \_________________ FNV-1a 64 hash _________________/
```

Rules:

- Lowercase every byte in `A-Z`; label-length octets are `0-63` so lowercasing
  cannot accidentally touch them.
- Hash the terminating zero byte.
- A compression pointer aborts hashing (hash set to 0 = "no match").
- The key is 8 bytes in native byte order.

A native C/Go cross-check was used to confirm the two implementations produce
identical hashes.

---

## 5. Go bridge (`adapters/mitigations/ebpf`)

### 5.1 Load, probe, `SUPPORTED`

`module/Module.guard.bpfel.go` (and `.bpfeb.go`) embed the bytecode
(`//go:embed module.bpfel`) and load it in `init()`:

1. `rlimit.RemoveMemlock()` (best effort).
2. `ebpf.LoadCollectionSpecFromReader`.
3. `spec.LoadAndAssign(&Module, nil)`.
4. `probe()` looks up a sentinel key in `port_bans`; `nil` or `ErrKeyNotExist` means the map is usable.
5. `module.Loaded = true` only on full success.

`ebpf.guard.go` sets `SUPPORTED = module.Loaded`, so the rest of the program
only uses the eBPF path when the load actually succeeded. On failure the full
verifier log is dumped via `reportError` (wraps `*ebpf.VerifierError`).

### 5.2 Attach / Detach

`AttachAll` enumerates `net.Interfaces()` and attaches to every non-loopback,
up interface. Native XDP is attempted first, then `XDPGenericMode`.
`Attach(name)`/`Detach(name)` are explicit. Links are tracked in
`module.Links`.

### 5.3 Map helpers

- Addresses/subnets/ports/domains are written with
  `Update(key, 1, ebpf.UpdateAny)` and removed with `Delete`.
- Lookups use `errors.Is(err, ebpf.ErrKeyNotExist)` (cilium wraps map errors;
  `==` never matches. See P13).
- `IsForbiddenSubnet` accepts `<= 32` / `<= 128` so `/32` and `/128` are
  queryable.

### 5.4 Resolved A/AAAA installation (user space)

When a **domain** is forbidden, `Inspect.guard.go:ForbidAddress`:

1. writes the domain hash into `domain_bans` (so that XDP program drops its DNS responses)
2. resolves the domain with `net.LookupIP` and calls `module.ForbidAddress`
   for every returned `A` / `AAAA` address.

`PermitAddress` mirrors this. This is why arbitrary TCP connections to a banned
domain's IPs are blocked by the ordinary address-ban lookup, even if the client
already knew the IP.

---

## 6. Actions and CLI

| Action            | Arity | Behaviour                                    | Exit codes                  |
|-------------------|-------|----------------------------------------------|-----------------------------|
| `forbid <target>` | 1     | ban address/subnet/ASN/connection/domain     | 0 / 1                       |
| `permit <target>` | 1     | remove a ban                                 | 0 / 1                       |
| `check <target>`  | 1     | is it forbidden?                             | 0 no / 1 yes / 3 no support |
| `search <target>` | 1     | print ASN/network details                    | 0 found / 1 not             |
| `init`            | 0     | load + attach all interfaces                 | 0 / 1                       |
| `load <file>`     | 1     | apply line-separated `forbid`/`permit` rules | 0 / 1                       |
| `status`          | 0     | list current bans                            | 0                           |
| `selftest`        | 0     | in-process map round-trips + attach          | 0 / 1                       |

Target parsing (`actions/Target.go`) follows RFC 2732 for IPv6:

`[v6]`, `[v6]/prefix`, `[v6]:port`.

---

## 7. Fallbacks

The fallbacks mirror the eBPF adapter's surface (`Forbid*`/`Permit*`/`IsForbidden*`
plus `Status`) so that actions can select a backend per target kind:

- `iptables`: used when eBPF is unavailable. IPv4 (`iptables`/`iptables-nft`) and
  IPv6 (`ip6tables`/`ip6tables-nft`) are detected separately; port rules are
  installed for both families. Rules are appended to `INPUT` and `OUTPUT`, are
  idempotent (`-C` before `-A`), and are tracked in-process for `status`/`flush`.
  Coarse; not equivalent to eBPF.
- `hosts`: rewrites only a managed block in `/etc/hosts` (delimited by
  `# BEGIN THOLIAN FIREWALL` / `# END THOLIAN FIREWALL`), preserving all other
  lines. Domain bans write both `0.0.0.0` and the IPv6 unspecified address, and
  matching is case-insensitive.

Backend selection lives in `actions/backend.go`: addresses, subnets, and ports
use eBPF then iptables; domains use eBPF then hosts.


---

## 8. Build system and tags

The `make.sh` builds the system with the correct build tags.

The `build_ebpf()` method:

1. `clang -S -emit-llvm` builds `module.ll`
2. `llc -march=bpfel` and `-march=bpfeb` builds the committed bytecode.
3. `-DENABLE_DNSFILTER` is passed as compiler flag.

**Do not pass `-c` with `-S -emit-llvm`** (P10).

The `build_source()` method cross-compiles `tholian-firewall-<variant>-<arch>`.

Build tags:

| Tag                                      | Effect                         |
|------------------------------------------|--------------------------------|
| `guard` (or `guard_<distro>`)            | real eBPF adapter + `insights` |
| `guard_openwrt`                          | real eBPF adapter only         |
| `guard_freebsd` / `_netbsd` / `_openbsd` | eBPF disabled, iptables/hosts  |
| `intel` / `oversight`                    | eBPF stubs returning `false`   |

Architecture selects little-endian (`module.bpfel`) vs big-endian
(`module.bpfeb`) bytecode.

---

## 9. Testing architecture

Privileged eBPF behaviour cannot be tested in separate processes because maps
and XDP links are process-scoped (D10). Therefore:

- Unit tests live next to the code (`types`, `matchers`).
- Integration tests live in `source/tests/` and are compiled into **one**
  binary:
  ```bash
  go test -c -tags guard -o build/linux/tholian-firewall-tests ./tests;
  sudo env THOLIAN_TEST_ATTACH=1 build/linux/tholian-firewall-tests -test.v;
  ```
- `test.sh` automates: unit tests via `make.sh ebpf` which builds the CLI
  and then builds the test binary and runs it under `sudo`. The CLI smoke
  tests output everything to `logs/test.log`.
- `TestDNSDrop` crafts a DNS response and runs the program via
  `BPF_PROG_TEST_RUN` to assert `XDP_DROP`.
- `TestDomainResolutionInstall` asserts resolved `A` / `AAAA` addresses land
  in the ban maps.
- `TestAttachAll` is opt-in (`THOLIAN_TEST_ATTACH=1`) and detaches immediately.

When running the compiled test binary **directly**, use `-test.run`
(not `-run`; see P21).

---

## 10. Design decisions

### D1 - Embed hand-written bytecode, not generated bpf2go

The `module.c` compiles to `module.bpfel`/`module.bpfeb`, which is embedded,
and then we hand-write a `Module` struct with `ebpf:"..."` tags loaded via
`LoadAndAssign`.

The idea is to keep a single generated artifact without adding `go:generate`
or bpf2go tooling; the map/program names are stable. This is why the struct
must be kept in sync with the C code manually.

### D2 - Ban-only, delete-to-permit

There is no allowlist or default-deny. `permit` deletes a ban. This ensures
the simplest correct semantics and avoids precedence rules in the hot path.

### D3 - Ingress-only enforcement

XDP runs on receive. Locally-originated egress is not inspected. The project's
near-term target is filtering inbound/forwarded traffic and dropping DNS
responses. Adding TC/clsact egress support is future work.

The consequence is that outbound bans only take effect indirectly when the
remote's reply is dropped, so that the handshake cannot complete.

### D4 - Auto-attach to all non-loopback interfaces

`AttachAll` enumerates interfaces. A firewall that is not attached filters
nothing.

**TODO**: Explicit interface selection is future work.

### D5 - DNS: kernel drop + user-space A/AAAA installation

The kernel drops banned DNS responses (tiny, verifier-cheap). Resolved
addresses are installed in user space at ban time via `ForbidAddress`.
In-BPF answer parsing repeatedly failed the verifier (P6-P9).

This keeps the hot path simple and still blocks connections to the resolved IPs.

### D6 - Domain key = FNV-1a 64 over lowercased wire form

A 64-bit hash key (instead of a 254-byte name) avoids the key-size bug (P1),
avoids expensive byte comparisons in BPF, and matches exactly between C and Go.
Hashing the raw wire form lets the kernel use one flat loop.

### D7 - Keep the embedded internet dataset (`Internet.json.gz`)

`//go:embed` + `json.Unmarshal` was chosen over runtime file loading or a
compact binary index for now. This allows zero external setup.

The file is currently around ~800MB in-memory, and the file must be present
at build time. In the future there might be a deployment-targeted internet
map that's embedded. Maybe with zones like Europe/Non-Europe/etc?

### D8 - Go integration tests compiled with `go test -c`

The privileged checks must run in a single process (D10), and `go test -c`
produces one self-contained binary that `test.sh` runs under `sudo`. Tests
skip gracefully without root.

### D9 - Explicit build tags for backends

`guard*` selects the real eBPF adapter; `guard_*bsd`, `intel`, `oversight`
select stubs/fallbacks. The same source tree must build for non-Linux and
for reduced feature sets.

### D10 - Accept process-scoped state for now

Maps and XDP links are not pinned, so the standalone CLI detaches on exit and
cannot share state between invocations. The library is intended to be embedded
in a long-running backend that calls `Init` once.

**TODO**: Pinning and a daemon/IPC mode is future work. This is why integration
tests currently all run in-process.

---

## 11. Implementation pitfalls

### P1 - BTF map key declared with `__uint` instead of a type

**Symptom:** domain updates failed / a ~66 MB map.
**Cause:** `__uint(key, 254)` expands to `int (*key)[254]`; libbpf computed
`key_size = 254 * 4 = 1016`, while Go wrote 254-byte keys.
**Rule:** define keys with `__type(key, ...)`; never `__uint` for key/value.
Verify with `bpftool btf dump file module.bpfel format raw`.

### P2 - Comparing the map-value pointer instead of the value

**Symptom:** "0 = unbanned" was impossible.
**Cause:** `if (banned != NULL && *banned != 0)` was written as
`banned != 0` (a second NULL check).
**Rule:** always dereference map values. `*banned != 0`.

### P3 - Dropping ICMPv6 NDP

**Symptom:** IPv6 connectivity breakage.
**Cause:** NDP (133-136) and echo (128/129) were in the drop table.
**Rule:** never drop NDP. Keep an explicit pass-list for well-known ICMPv6
types.

### P4 - TCP cursor ignoring `doff`

**Symptom:** corrupted parsing after TCP options.
**Cause:** `nh->pos = tcph + 1` (fixed 20 bytes).
**Rule:** advance by `doff * 4` and bounds-check.

### P5 - Endianness on packet fields

**Symptom:** Nmap heuristic never matched.
**Cause:** `tcp_header->window` (network order) compared to a host-order
constant.
**Rule:** `bpf_ntohs`/`bpf_htons` every multi-byte packet field; keep map keys
in the byte order the helper expects.

### P6 - Following DNS compression pointers in XDP

**Symptom:** `invalid access to packet and R9 min value is outside of the allowed
memory range`.
**Cause:** `cur = dns_base + ptr` produced a packet pointer the verifier could
not bound; the subsequent dereference was rejected.
**Rule:** never follow compression pointers in XDP. Terminate at a pointer.

### P7 - Optimizer CSE removing fixed-size bounds checks

**Symptom:** the verifier lost a bound the source clearly checked.
**Cause:** the earlier generic `rdata + rdlen > data_end` check used a register
that was later reused for `rtype`; the compiler proved `rdata + 4` redundant and
deleted it, but the verifier cannot relate `r1 + rlen <= end` to `rlen == 4`.
**Rule:** a bounds check must use the **same register and a constant size**
immediately before the dereference. Inspect `llc -filetype=asm` to confirm the
guard is actually emitted. A compiler barrier can prevent deletion, but is a
fragile last resort.

### P8 - Packet offsets exceeding `MAX_PACKET_OFF`

**Symptom:** `R2 min value is outside of the allowed memory range` after several
loop iterations.
**Cause:** `pos = rdata + rdlen` with unbounded `rdlen` accumulated a variable
offset > `0xffff`.
**Rule:** cap every variable advance and keep the accumulated offset well under
`0xffff`; re-check bounds each iteration.

### P9 - Verifier state explosion (1M instruction limit)

**Symptom:** `BPF program is too large. Processed 1000001 insn` with high
`peak_states`.
**Cause:** nested loops (an answer loop containing a name-walk loop), even when
the name-walk was `#pragma unroll`-ed; each iteration multiplied verifier
states.
**Rule:** avoid nested loops over packet data. Prefer one flat loop with a
fixed base pointer and a bounded scalar index. If a protocol needs variable
structure, **parse it in user space** (D5). Use `bpf_loop`/tail calls only with
care and test on the target kernel.

### P10 - clang rejects `-c` with `-S -emit-llvm`

**Symptom:** build fails with `unused-command-line-argument` under `-Werror`.
**Rule:** do not pass `-c` when using `-S`/`-emit-llvm`.

### P11 - cilium/ebpf version too old for a modern kernel

**Symptom:** `map create: prealloc maps not supported (requires >= v4.6)`.
**Cause:** the old release's NO_PREALLOC feature probe failed on the target
kernel.
**Fix:** bumped `github.com/cilium/ebpf` v0.10.0 to v0.18.0 (source-compatible
for the APIs used). Keep the dependency current when targeting new kernels.

### P12 - MEMLOCK / capabilities

**Symptom:** `operation not permitted (MEMLOCK may be too low ...)`.
**Fix:** `rlimit.RemoveMemlock()` before loading; root or `CAP_BPF`/`CAP_NET_ADMIN`
is still required to create maps/attach.

### P13 - `err == ebpf.ErrKeyNotExist` never matches

**Symptom:** `permit` on a non-existent key returned false.
**Cause:** cilium wraps map errors (`fmt.Errorf("lookup: %w", ...)`).
**Rule:** use `errors.Is(err, ebpf.ErrKeyNotExist)`.

### P14 - Missing embedded data file

**Symptom:** build fails with `pattern Internet.json.gz: no matching files
found`.
**Cause:** a required `//go:embed` file was gitignored.
**Rule:** every embedded file must be tracked (or generated) at build time.

### P15 - Cross-module import (`tholian-endpoint`)

**Symptom:** `go build ./...` failed; wrong module dependency.
**Cause:** copy-pasted imports pointing at a different project.
**Rule:** only depend on declared modules; keep fallback stubs compiling.

### P16 - Action routing shadowed by the default value

**Symptom:** IP/subnet bans were silent no-ops.
**Cause:** `matchers.NewNetwork()` sets `Name = "any"`, and actions tested
`if search.Name != ""`, which is always true, so they always took the ASN
branch.
**Rule:** never treat a sentinel (`"any"`) as "unset". Use an explicit
discriminator.

### P17 - IPv6 validators

**Symptom:** IPv6 CLI input rejected; bare IPv6 never validated.
**Cause:** validators split the *bracketed* `formatIPv6` output and wrapped an
already-bracketed value in another pair; `Scope()` compared `"["`-prefixed
constants against the unbracketed `String()`.
**Rule:** unit-test address parsing for both bracketed and bare forms; keep
`Is*` and `Parse*` consistent.

### P18 - Subnet containment masked with the wrong prefix

**Symptom:** `containsSubnet("1.3.3.0/24", "1.3.3.7/32")` returned false.
**Cause:** the narrower network was masked with its own prefix, so host bits
differed.
**Rule:** mask both operands with the **broader** prefix before comparing.

### P19 - CLI state does not persist

**Symptom:** `forbid` then `check` in separate invocations showed nothing.
**Cause:** unpinned maps/links are process-scoped (D10).
**Rule:** test privileged behaviour in-process (`selftest` / `go test -c`);
embed the library in a long-running backend for real deployments.

### P20 - `go test -c` binary flag names

**Symptom:** `flag provided but not defined: -run`.
**Rule:** when executing the compiled test binary directly, use `-test.v` and
`-test.run` (the `go test` driver translates `-run`).

---

## 12. Working rules for future eBPF work

1. Change the C and the Go helpers together. Verify the BTF key size after
   every map change (`bpftool btf dump ... format raw`).
2. Rebuild artifacts (`bash make.sh ebpf`) and commit `module.ll`,
   `module.bpfel`, `module.bpfeb` whenever `module.c`/`module.h` change.
3. Never trust the source for verifier safety. Inspect the generated asm and
   the full verifier log (`reportError` dumps it). Watch `processed N insns`,
   `peak_states`, and any `outside of the allowed memory range`.
4. Fail open. Drop only on a confident match; pass anything you cannot parse.
5. No pointer following, no nested packet loops, bounded offsets, constant
   guards. When in doubt, move parsing to user space.
6. Keep the Go side clear: `errors.Is` for cilium errors, exact key
   sizes/byte order, and update `SUPPORTED` only after a successful probe.
7. Test under `sudo` via `test.sh`, and check `logs/test.log`.

---

## 13. Known limitations

- XDP is ingress-only; outbound traffic is not directly filtered.
- Maps and XDP links are not pinned; the standalone CLI does not persist.
- The embedded internet dataset is large and parsed fully at startup.
- Encrypted DNS (DoT/DoH) cannot be inspected for domains.
- DNS over TCP is passed through (only UDP 53/5353 is filtered).
- The iptables/hosts fallbacks are coarse and not equivalent to eBPF.
- `permit` cannot carve a hole in a broader ban.

---

## 14. Glossary

- XDP means eXpress Data Path, a kernel hook at the earliest receive point.
- BTF means BPF Type Format; used to describe map keys/values and relocations.
- LPM trie means longest-prefix-match map, used for subnets.
- FNV-1a means non-cryptographic hash used for domain keys.
- Verifier is the in-kernel safety checker that rejects unsafe BPF programs.
- `guard` tag is the build tag selecting the real eBPF backend.

