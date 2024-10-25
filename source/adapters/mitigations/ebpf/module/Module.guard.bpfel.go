//go:build (guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu) && (386 || amd64 || amd64p32 || arm || arm64 || mips64le || mips64p32le || mipsle || ppc64le || riscv64)

package module

import "github.com/cilium/ebpf"
import "github.com/cilium/ebpf/link"
import "tholian-firewall/console"
import "bytes"
import _ "embed"

//go:embed module.bpfel
var embedded_bpf_module []byte

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

func init() {

	Links = make(map[string]*link.Link)

	reader := bytes.NewReader(embedded_bpf_module)
	spec, err1 := ebpf.LoadCollectionSpecFromReader(reader)

	if err1 == nil {

		err2 := spec.LoadAndAssign(&Module, nil)

		if err2 == nil {
			console.Info("adapters/ebpf: eBPF Module loaded")
		} else {
			console.Error(err2.Error())
			console.Error("adapters/ebpf: eBPF Module disabled")
		}

	} else {
		console.Error(err1.Error())
		console.Error("adapters/ebpf: eBPF Module disabled")
	}

}
