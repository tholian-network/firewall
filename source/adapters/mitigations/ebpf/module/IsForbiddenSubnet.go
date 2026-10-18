//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu || guard_freebsd || guard_netbsd || guard_openbsd

package module

import "github.com/cilium/ebpf"
import "tholian-firewall/types"
import "tholian-firewall/structs"
import "errors"

func IsForbiddenSubnet(console *structs.Console, address string, prefix uint8) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if prefix <= 128 {

			if Module.IPv6Bans != nil {

				var value uint8

				err := Module.IPv6Bans.Lookup(ToBPFIPv6(address, prefix), &value)

				if err == nil {

					if value != 0 {
						result = true
					}

				} else if errors.Is(err, ebpf.ErrKeyNotExist) {
					result = false
				}

			}

		}

	} else if types.IsIPv4(address) {

		if prefix <= 32 {

			if Module.IPv4Bans != nil {

				var value uint8

				err := Module.IPv4Bans.Lookup(ToBPFIPv4(address, prefix), &value)

				if err == nil {

					if value != 0 {
						result = true
					}

				} else if errors.Is(err, ebpf.ErrKeyNotExist) {
					result = false
				}

			}

		}

	}

	return result

}
