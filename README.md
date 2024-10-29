# Tholian® Firewall

A programmable eBPF Firewall that can be used from within `Go`-based backends
and as a standalone CLI tool, with advanced features like automatic port scan
or exfil network protocol detection.

:construction: EXPERIMENTAL SOFTWARE - USE AT OWN RISK :construction:


## Building

### Building the eBPF Module

The [eBPF](./ebpf) module is required to block network traffic before it reaches
the kernel. There's a fallback implementation using `iptables` available, but it
is not recommended. The eBPF module far outweighs iptables performance by any means.

This kernel space eBPF module is compiled down to bytecode, so hopefully it does not
need to be recompiled after the first time.

In case you need to, this is how to do it:

```bash
# Build Dependencies
sudo pacman -S --needed binutils coreutils go bpf libbpf clang llvm llvm-libs lib32-llvm-libs;

cd /path/to/tholian-firewall;
bash make.sh ebpf;
```


### Building the Go Program

```bash
cd /path/to/tholian-firewall;
bash make.sh source;
```


### Build Tags

The `tholian-firewall` codebase uses two different reserved go build tags:

- `guard` which includes the [ebpf module](/source/adapters/mitigations/ebpf) and all [insights](/source/insights).
- `guard_openwrt` which includes the [ebpf module](/source/adapters/mitigations/ebpf).

There are also build tags which will fallback to `iptables` and `hosts` usage,
due to lack of support for Linux's eBPF API on those operating systems:

- `guard_freebsd`
- `guard_netbsd`
- `guard_openbsd`


### Running from Source

The easiest way to run the Firewall CLI:

```bash
cd /path/to/tholian-firewall/source;
sudo go run -tags `guard` ./cmds/tholian-firewall/main.go;
```


# License

Proprietary

