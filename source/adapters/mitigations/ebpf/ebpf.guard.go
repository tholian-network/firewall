//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"

var SUPPORTED bool

func Init(console *structs.Console) {

	module.Init(console)

	SUPPORTED = module.Loaded

	if SUPPORTED == true {
		console.Info("adapters/ebpf: eBPF backend enabled")
	} else {
		console.Warn("adapters/ebpf: eBPF backend disabled")
	}

}

func IsSupported() bool {
	return SUPPORTED
}

func Close() {

	if SUPPORTED == true {
		module.Close()
		SUPPORTED = false
	}

}
