# Tholian® Firewall

Programmable eBPF firewall for Go backends.

The Tholian Firewall blocks network traffic at the earliest possible point.
It uses eBPF and XDP kernel modules that block the traffic before it can
reach your operating system's networking stack.

It is designed to be embedded directly into a Go service as a library,
and also ships as a standalone CLI for scripting and operations.


## Motivations

Traditional firewalls are configured out-of-band, live in a different process,
and force every connection through a userspace decision or a rule interpreter.

The Tholian Firewall takes a different stance:

- In-kernel filtering: The XDP program drops matching packets at the driver
  receive path, so they never reach the network stack.
- Embeddable: A Go backend can call `actions.Forbid` / `actions.Permit` /
  `actions.Check` directly and control the firewall from within its own process.
- Programmable: Targets are ordinary values like IP addresses, subnets, ports,
  ASNs, and domains. No external rule syntax.
- Verifier-safe by design: The kernel program is kept small and flat. Complex
  protocol work (like DNS answer extraction) is done in Go where it is cheap and
  testable.
- Fallbacks included: On platforms without eBPF, `iptables`/`ip6tables` and
  `/etc/hosts` are used instead.

## Design Goals

1. Filter ingress traffic at kernel speed using XDP, with a stable, tiny verifier
   memory footprint.
2. Be a first-class Go library without CGo dependencies. No daemon required in
   the embedding process, no external rule engine.
3. Cover the common blocking primitives like IPv4/IPv6 addresses, CIDR subnets,
   TCP/UDP ports, ASN-derived networks, and domains.
4. Stay honest about state and the API always reports whether a ban was actually
   applied, and degrades to fallbacks when eBPF is unavailable.
5. Privileged behaviour is exercised by Go integration tests which are compiled
   into a single binary and run under `sudo`.

## Requirements

- Linux with XDP support (`CONFIG_X86_64`, a NIC/driver with XDP, or SKB mode).
- Root, or `CAP_BPF` + `CAP_NET_ADMIN` (map creation and XDP attach need them).
- To build: `go`, `clang`, `llc`/LLVM, and libbpf headers.

## Building

### eBPF module

```bash
cd /path/to/tholian-firewall;
bash make.sh ebpf;
```

This compiles the [eBPF module](ebpf/module/module.c) with `-DENABLE_DNSFILTER`,
emits LLVM IR, and generates little- and big-endian bytecode (`module.bpfel`,
`module.bpfeb`) that the Go bridge embeds. The generated artifacts are committed;
rebuild them whenever the C code changes.

### Go program

```bash
cd /path/to/tholian-firewall;
bash make.sh source;

ls ./build/linux/*;
# tholian-firewall-guard-amd64
# tholian-firewall-guard-arm64
# tholian-firewall-guard_openwrt-amd64
# tholian-firewall-guard_openwrt-arm64
```

### Build tags

| Tag                                                | Includes                             |
|----------------------------------------------------|--------------------------------------|
| `guard` (and `guard_<distro>`)                     | eBPF adapter + `insights` (ASN data) |
| `guard_openwrt`                                    | eBPF adapter only                    |
| `guard_freebsd` / `guard_netbsd` / `guard_openbsd` | iptables/hosts fallback              |
| `intel` / `oversight`                              | eBPF stubs                           |

## Running the CLI

```bash
sudo ./build/linux/tholian-firewall-guard-amd64 <action> [target]
```

Targets use RFC 2732 syntax for IPv6 (`[v6]`, `[v6]/prefix`, `[v6]:port`):

```bash
# Block an address, a subnet, and a connection
sudo tholian-firewall forbid "1.3.3.7";
sudo tholian-firewall forbid "1.3.3.0/24";
sudo tholian-firewall forbid "1.3.3.7:1338";

# Block an IPv6 target
sudo tholian-firewall forbid "[fe80::1337]/64";
sudo tholian-firewall forbid "[fe80::1337]:1338";

# Block a domain: drops its DNS responses and bans the resolved IPs
sudo tholian-firewall forbid "evil.example";

# Check (exit 0 = allowed, 1 = forbidden, 3 = no backend)
sudo tholian-firewall check "1.3.3.7";

# Look up the network/ASN data for an address
sudo tholian-firewall search "1.1.1.1";

# Attach to all interfaces, inspect current bans
sudo tholian-firewall init;
sudo tholian-firewall status;
```

You can also apply a rule file:

```text
# rules.txt
forbid 1.3.3.7;
forbid 1.3.3.0/24;
forbid evil.example;
permit 8.8.8.8;
```

```bash
sudo tholian-firewall load rules.txt;
```

## Embedding in a Go backend

Tholian is a library first. Call `actions.Init()` once at startup to load the
eBPF module and attach it to the interfaces, then drive it from your own code:

```go
import "tholian-firewall/actions"

func main() {

    if actions.Init() == false {
        // no eBPF backend available; fall back or exit
    }

    actions.Forbid("1.3.3.7")
    actions.Forbid("evil.example")

    if actions.Check("1.3.3.7") {
        // traffic to 1.3.3.7 is currently dropped
    }

    actions.Permit("1.3.3.7")
}
```

Because unpinned BPF maps and XDP links live in the process that created them,
the embedding process must stay alive for filtering to continue. Pinned maps and
a daemon/IPC mode are planned; see [docs/ROADMAP.md](docs/ROADMAP.md).

## Testing

Unit tests run anywhere; integration tests need root and a BPF-capable kernel:

```bash
bash test.sh
```

The full log is written to `logs/test.log`. The suite builds a single
integration test binary with `go test -c` and runs it under `sudo`, then does a
CLI smoke test. See [docs/TESTING.md](docs/TESTING.md) for details.

## Documentation

- [ARCHITECTURE.md](docs/ARCHITECTURE.md) documents the architecture, decisions,
  and the eBPF pitfalls (read this before changing the kernel module).
- [TESTING.md](docs/TESTING.md) documents how to run and read the tests.
- [TODO.md](TODO.md) documents the short-term task list.

## Limitations

- XDP is ingress-only; outbound traffic is not directly filtered.
- Maps and XDP links are process-scoped and not pinned (no persistence yet).
- Encrypted DNS (DoT/DoH) cannot be inspected; DNS-over-TCP is passed through.
- The embedded internet map is large (~31 MB gzip / ~825 MB raw) and parsed at startup.
- `permit` removes a ban; it cannot carve a hole in a broader ban.

## License

Proprietary.
