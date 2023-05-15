# Usage

```bash
# Rebuild the eBPF kernel module
bash make.sh ebpf;

# Rebuild the test/main userspace program
bash make.sh source;
```

```bash
cd ./source;
sudo go run ./main.go;
```


# Dependencies

- [ ] Use `github.com/cilium/ebpf` as userspace API

# Features

- [ ] Be able to block network traffic from a specific IPv4
- [ ] Be able to allow network traffic from a specific IPv4

- [ ] Be able to block network traffic from a specific IPv6
- [ ] Be able to allow network traffic from a specific IPv6

- [ ] Be able to block network traffic from a specific domain (block DNS requests/responses to/from that domain)
- [ ] Be able to allow network traffic from a specific domain

# TODO List of things to implement

In the eBPF [module.c](./kernel/ebpf/module.c):

- [ ] Fix the eBPF kernel module and the BPF maps (which might be dependent on network byte order or host byte order)
- [ ] Add the `ENABLE_DNSFILTER` flag to the `build_ebpf()` method in the `make.sh`
- [ ] Implement the `parse_dns_question()` which is incorrectly implemented and doesn't run through the eBPF verifier
- [ ] Implement the `is_dns_exfiltration()` method and integrate it for UDP/DNS requests
- [ ] Implement the `is_malicious_dns_packet()` method and integrate it for UDP/DNS requests

In [ForbidNetwork.go](./source/adapters/mitigations/ForbidNetwork.go):

- [ ] Implement the `isForbidden()` method to lookup the BPF maps correctly
- [ ] Implement the `forbid()` method to create a BPF map entry
- [ ] Implement the `ForbidNetwork()` method

In [PermitNetwork.go](./source/adapters/mitigations/PermitNetwork.go):

- [ ] Implement the `permit()` method to delete a BPF map entry
- [ ] Implement the `PermitNetwork()` method

