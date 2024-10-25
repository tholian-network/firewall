package module

import "github.com/cilium/ebpf"

var Specifications = ebpf.CollectionSpec{
	Maps: map[string]*ebpf.MapSpec{
		"domain_bans": {
			Name:       "domain_bans",
			Type:       ebpf.Hash,
			MaxEntries: 65535,
			KeySize:    254,
			ValueSize:  1,
		},
		"ipv4_bans": {
			Name:       "ipv4_bans",
			Type:       ebpf.LPMTrie,
			MaxEntries: 65535,
			KeySize:    8,
			ValueSize:  1,
		},
		"ipv4_warnings": {
			Name:       "ipv4_warnings",
			Type:       ebpf.LRUHash,
			MaxEntries: 128,
			KeySize:    8,
			ValueSize:  1,
		},
		"ipv6_bans": {
			Name:       "ipv6_bans",
			Type:       ebpf.LPMTrie,
			MaxEntries: 65535,
			KeySize:    20,
			ValueSize:  1,
		},
		"ipv6_warnings": {
			Name:       "ipv6_warnings",
			Type:       ebpf.LRUHash,
			MaxEntries: 128,
			KeySize:    20,
			ValueSize:  1,
		},
		"port_bans": {
			Name:       "port_bans",
			Type:       ebpf.Hash,
			MaxEntries: 65535,
			KeySize:    2,
			ValueSize:  1,
		},
	},
	Programs: map[string]*ebpf.ProgramSpec{
		"xdp_prog_main": {
			Type:    ebpf.XDP,
			License: "GPL",
		},
	},
}
