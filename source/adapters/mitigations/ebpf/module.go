package ebpf

import "github.com/cilium/ebpf"

type BPF_SPECS struct {
	BPF_PROGRAM_SPECS
	BPF_MAP_SPECS
}

type BPF_PROGRAM_SPECS struct {
	XdpProgMain *ebpf.ProgramSpec `ebpf:"xdp_prog_main"`
}

type BPF_MAP_SPECS struct {
	Ipv4Bans *ebpf.MapSpec `ebpf:"ipv4_bans"`
	Ipv6Bans *ebpf.MapSpec `ebpf:"ipv6_bans"`
	PortBans *ebpf.MapSpec `ebpf:"port_bans"`
}

type BPF_OBJECTS struct {
	BPF_PROGRAMS
	BPF_MAPS
}

func (objects *BPF_OBJECTS) Close() {
	objects.BPF_PROGRAMS.Close()
	objects.BPF_MAPS.Close()
}

type BPF_PROGRAMS struct {
	XdpProgMain *ebpf.Program `ebpf:"xdp_prog_main"`
}

func (programs *BPF_PROGRAMS) Close() {
	programs.XdpProgMain.Close()
}

type BPF_MAPS struct {
	Ipv4Bans *ebpf.Map `ebpf:"ipv4_bans"`
	Ipv6Bans *ebpf.Map `ebpf:"ipv6_bans"`
	PortBans *ebpf.Map `ebpf:"port_bans"`
}

func (maps *BPF_MAPS) Close() {
	maps.Ipv4Bans.Close()
	maps.Ipv6Bans.Close()
	maps.PortBans.Close()
}
