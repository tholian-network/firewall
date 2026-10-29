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

1. Filter ingress traffic at kernel speed using XDP.
2. Be a first-class Go library without CGo dependencies. No daemon required in
   the embedding process, no external rule engine.
3. Cover the common blocking primitives like IPv4/IPv6 addresses, CIDR subnets,
   TCP/UDP ports, ASN-derived networks, and domains.
4. Always report the correct state about filtered origins, and degrade only to
   fallbacks when eBPF is unavailable.

## Requirements

The module is built using Go's module system. In the Tholian Network, all
repositories are checked out next to each other.

The shared Tholian Core Type System lives in the [tholian-core](https://github.com/tholian-network/core)
repository. This repository expects it to be checked out next to the firewall
folder:

```text
/path/to/Software/tholian-network/
|- core/        # tholian-core module
\- firewall/    # this repository
```

`source/go.mod` resolves the dependency with
`replace tholian-core => ../../core/source`, which is relative to the `source/`
directory. If your checkout uses a different directory name or location, adjust
that `replace` directive accordingly.

### Build tags

| Tag                                                | Includes                             |
|----------------------------------------------------|--------------------------------------|
| `guard` (and `guard_<distro>`)                     | eBPF adapter + `insights` (ASN data) |
| `guard_openwrt`                                    | eBPF adapter only                    |
| `guard_freebsd` / `guard_netbsd` / `guard_openbsd` | iptables/hosts fallback              |
| `intel` / `oversight`                              | eBPF stubs                           |
| no tag                                             | eBPF stubs + iptables/hosts fallback |

## Building

Building requires `make`, `go`, `clang`, `llc` (LLVM), and libbpf headers.
The embedded `source/insights/Internet.json.gz` dataset for `guard_<distribution>`
builds. It is intentionally not tracked by Git.

Run `make help` to list all available targets.

### eBPF module

```bash
cd /path/to/tholian-firewall;
make build-ebpf;
```

This compiles the [eBPF module](ebpf/module/module.c) with `-DENABLE_DNSFILTER`,
emits LLVM IR, and generates both the little-endian (`module.bpfel`) and big-endian
bytecodes (`module.bpfeb`) that the Go bridge embeds.

The generated artifacts are tracked by Git; rebuild them whenever the C code changes.

### Firewall CLI

```bash
cd /path/to/tholian-firewall;
make build-cli;

ls ./build/linux/*;
# tholian-firewall-guard-amd64
# tholian-firewall-guard-arm64
# tholian-firewall-guard_openwrt-amd64
# tholian-firewall-guard_openwrt-arm64
```

## Usage

- Linux with XDP support (NIC/driver with XDP, or SKB mode).
- Root, or `CAP_BPF` and `CAP_NET_ADMIN` (to use BPF map creation and XDP attach).

### Usage: Firewall CLI

```bash
sudo ./build/linux/tholian-firewall-guard-amd64 <action> [target]
```

Targets use RFC 2732 syntax for IPv6 (`[v6]`, `[v6]/prefix`, `[v6]:port`):

```bash
# Block an address, a subnet, and an exact socket
sudo tholian-firewall forbid "1.3.3.7";
sudo tholian-firewall forbid "1.3.3.0/24";
sudo tholian-firewall forbid "1.3.3.7:1338";

# IP:Port bans only the exact socket, not the whole address
sudo tholian-firewall forbid "1.3.3.7:1338";
sudo tholian-firewall check "1.3.3.7"; # still allowed
sudo tholian-firewall check "1.3.3.7:1338"; # forbidden

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

## Testing

Unit tests do not need root. Every `guard`-tagged target, including
`make check`, requires the embedded Internet dataset. The integration and
end-to-end suites additionally need root and a BPF-capable kernel:

```bash
make check;    # formatting, vet, and unit tests
make test;     # unit tests + eBPF build + in-process integration suite
make test-e2e; # external CLI end-to-end suite (sudo is handled by make)
```

`make test-with-log` writes `logs/test.log` and `make test-e2e-with-log` writes
`logs/test_e2e.log`. Run `make test-all` to execute both suites. Set
`THOLIAN_TEST_ATTACH=0` to skip the intrusive XDP attach tests
(`make test-e2e THOLIAN_TEST_ATTACH=0`).
See [TESTING.md](docs/TESTING.md) for details.

## Documentation

- [ARCHITECTURE.md](docs/ARCHITECTURE.md) documents the architecture, decisions,
  and the eBPF pitfalls (read this before changing the kernel module).
- [TESTING.md](docs/TESTING.md) documents how to run and read the tests.
- [TODO.md](docs/TODO.md) documents the short-term task list.

## Limitations

- XDP is ingress-only; outbound traffic is not directly filtered.
- Maps and XDP links are process-scoped and not pinned (no persistence yet).
- Encrypted DNS (DoT/DoH) cannot be inspected; DNS-over-TCP is passed through.
- The embedded internet map is large (~31 MB gzip / ~825 MB raw) and parsed at startup.
- `permit` removes a ban; it cannot carve a hole in a broader ban.
- `forbid IP:port` creates an exact socket ban. Does not ban the whole address.
- `forbid domain:port` still bans the whole domain, not a single socket.
- eBPF `status` prints domain bans as their FNV-1a hash, because the map only
  stores the hash, not the original name.

## License

The Tholian Firewall is licensed under the
[GNU Affero General Public License v3.0](./LICENSE.txt).

`(c) 2020-2026 by Tholian(r) Network`
