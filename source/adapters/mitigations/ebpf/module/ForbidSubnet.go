//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu || guard_freebsd || guard_netbsd || guard_openbsd

package module

import "github.com/cilium/ebpf"
import "tholian-core/structs"
import "tholian-core/types"

func ForbidSubnet(console *structs.Console, address string, prefix uint8) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if Module.IPv6Bans != nil {

			err := Module.IPv6Bans.Update(ToBPFIPv6(address, prefix), uint8(1), ebpf.UpdateAny)

			if err == nil {
				result = true
			} else {
				console.Error("adapters/ebpf: IPv6 Ban Error")
				console.Error(err.Error())
			}

		}

	} else if types.IsIPv4(address) {

		if Module.IPv4Bans != nil {

			err := Module.IPv4Bans.Update(ToBPFIPv4(address, prefix), uint8(1), ebpf.UpdateAny)

			if err == nil {
				result = true
			} else {
				console.Error("adapters/ebpf: IPv4 Ban Error")
				console.Error(err.Error())
			}

		}

	}

	return result

}
