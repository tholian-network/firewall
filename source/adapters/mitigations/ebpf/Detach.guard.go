//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/structs"
import "tholian-firewall/adapters/mitigations/ebpf/module"

func Detach(console *structs.Console, name string) bool {

	var result bool = false

	if SUPPORTED == true {

		ref, ok := module.Links[name]

		if ok == true {

			if ref != nil && *ref != nil {
				(*ref).Close()
			}

			delete(module.Links, name)

			console.Warn("adapters/ebpf: eBPF Module detached from \"" + name + "\"")
			result = true

		} else {

			result = true

		}

	}

	return result

}

func DetachAll(console *structs.Console) int {

	var count int = 0

	if SUPPORTED == true {

		for name := range module.Links {

			if Detach(console, name) == true {
				count = count + 1
			}

		}

	}

	return count

}
