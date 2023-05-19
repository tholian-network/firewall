package ebpf

import "github.com/cilium/ebpf"

var BPF struct {
	Program      *ebpf.Program `ebpf:"xdp_prog_main"`
	DomainBans   *ebpf.Map     `ebpf:"domain_bans"`
	IPv4Bans     *ebpf.Map     `ebpf:"ipv4_bans"`
	IPv4Warnings *ebpf.Map     `ebpf:"ipv4_warnings"`
	IPv6Bans     *ebpf.Map     `ebpf:"ipv6_bans"`
	IPv6Warnings *ebpf.Map     `ebpf:"ipv6_warnings"`
	PortBans     *ebpf.Map     `ebpf:"port_bans"`
}

type BPF_SPECS struct {
	BPF_PROGRAM_SPECS
	BPF_MAP_SPECS
}

type BPF_PROGRAM_SPECS struct {
	Program *ebpf.ProgramSpec `ebpf:"xdp_prog_main"`
}

type BPF_MAP_SPECS struct {
	DomainBans   *ebpf.MapSpec `ebpf:"domain_bans"`
	IPv4Bans     *ebpf.MapSpec `ebpf:"ipv4_bans"`
	IPv4Warnings *ebpf.MapSpec `ebpf:"ipv4_warnings"`
	IPv6Bans     *ebpf.MapSpec `ebpf:"ipv6_bans"`
	IPv6Warnings *ebpf.MapSpec `ebpf:"ipv6_warnings"`
	PortBans     *ebpf.MapSpec `ebpf:"port_bans"`
}

var BPF_SPECIFICATIONS = ebpf.CollectionSpec{
	Maps: map[string]*ebpf.MapSpec{
		"domain_bans": {
			Type:       ebpf.Hash,
			KeySize:    254,
			ValueSize:  1,
			MaxEntries: 500000,
		},
		"ipv4_bans": {
			Type:       ebpf.Hash,
			KeySize:    4,
			ValueSize:  1,
			MaxEntries: 500000,
		},
		"ipv4_warnings": {
			Type:       ebpf.LRUHash,
			KeySize:    4,
			ValueSize:  1,
			MaxEntries: 128,
		},
		"ipv6_bans": {
			Type:       ebpf.Hash,
			KeySize:    16,
			ValueSize:  1,
			MaxEntries: 500000,
		},
		"ipv6_warnings": {
			Type:       ebpf.LRUHash,
			KeySize:    16,
			ValueSize:  1,
			MaxEntries: 128,
		},
		"port_bans": {
			Type:       ebpf.Hash,
			KeySize:    2,
			ValueSize:  1,
			MaxEntries: 65535,
		},
	},
	Programs: map[string]*ebpf.ProgramSpec{
		"xdp_prog_main": {
			Type:    ebpf.XDP,
			License: "GPL",
		},
	},
}

