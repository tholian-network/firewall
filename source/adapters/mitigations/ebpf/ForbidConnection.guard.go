//go:build (guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu)

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/console"
import "tholian-firewall/types"
import "strconv"

func ForbidConnection(connection types.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		result_source := false
		result_target := false

		if connection.Type == "client" || connection.Type == "peer" {

			// local client is connecting to remote server

			if connection.Target.Host == "*" {

				if connection.Target.Port != 0 {

					if module.IsForbiddenPort(connection.Target.Port) {
						result_target = true
					} else {
						console.Warn("adapters/ebpf: Forbid Connection \"*:" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = module.ForbidPort(connection.Target.Port)
					}

				}

			} else if connection.Target.Host != ".arpa" {

				if module.IsForbiddenAddress(connection.Target.Host) {
					result_target = true
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Target.Host + ":*\"")
					result_target = module.ForbidAddress(connection.Target.Host)
				}

			}

		}

		if connection.Type == "server" || connection.Type == "peer" {

			// remote client is connecting to local server

			if connection.Source.Host == "*" {

				if connection.Source.Port != 0 {

					if module.IsForbiddenPort(connection.Source.Port) {
						result_source = true
					} else {
						console.Warn("adapters/ebpf: Forbid Connection \"*:" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = module.ForbidPort(connection.Source.Port)
					}

				}

			} else if connection.Source.Host != ".arpa" {

				if module.IsForbiddenAddress(connection.Source.Host) {
					result_source = true
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Source.Host + ":*\"")
					result_source = module.ForbidAddress(connection.Source.Host)
				}

			}

		}

		if connection.Type == "client" {

			result = result_target

		} else if connection.Type == "server" {

			result = result_source

		} else if connection.Type == "peer" {

			if result_source == true && result_target == true {
				result = true
			}

		}

	}

	return result

}
