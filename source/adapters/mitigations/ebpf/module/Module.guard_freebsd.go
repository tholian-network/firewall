//go:build guard_freebsd

package module

import "github.com/cilium/ebpf"
import "github.com/cilium/ebpf/link"

var Links map[string]*link.Link

var Module struct {
	Program      *ebpf.Program `ebpf:"xdp_prog_main"`
	DomainBans   *ebpf.Map     `ebpf:"domain_bans"`
	IPv4Bans     *ebpf.Map     `ebpf:"ipv4_bans"`
	IPv4Warnings *ebpf.Map     `ebpf:"ipv4_warnings"`
	IPv6Bans     *ebpf.Map     `ebpf:"ipv6_bans"`
	IPv6Warnings *ebpf.Map     `ebpf:"ipv6_warnings"`
	PortBans     *ebpf.Map     `ebpf:"port_bans"`
}

