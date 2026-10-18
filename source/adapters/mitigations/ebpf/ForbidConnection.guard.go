//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"
import "tholian-firewall/types"
import "strconv"

func forbidEndpoint(console *structs.Console, socket types.Socket) bool {

	if socket.IsAny() {

		if socket.HasPort() {

			if module.IsForbiddenPort(console, socket.Port) {
				return true
			}

			console.Warn("adapters/ebpf: Forbid Connection \"*:" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return module.ForbidPort(console, socket.Port)

		}

		return false

	}

	if socket.HasHost() {

		if socket.HasPort() {

			if module.IsForbiddenSocket(console, socket.Host, socket.Port) {
				return true
			}

			console.Warn("adapters/ebpf: Forbid Connection \"" + socket.Host + ":" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return module.ForbidSocket(console, socket.Host, socket.Port)

		}

		if module.IsForbiddenAddress(console, socket.Host) {
			return true
		}

		console.Warn("adapters/ebpf: Forbid Connection \"" + socket.Host + ":*\"")

		return module.ForbidAddress(console, socket.Host)

	}

	return false

}

func ForbidConnection(console *structs.Console, connection types.Connection) bool {

	if SUPPORTED == false {
		return false
	}

	result_source := false
	result_target := false

	if connection.IsClient() || connection.IsPeer() {
		result_target = forbidEndpoint(console, connection.Target)
	}

	if connection.IsServer() || connection.IsPeer() {
		result_source = forbidEndpoint(console, connection.Source)
	}

	if connection.IsClient() {
		return result_target
	} else if connection.IsServer() {
		return result_source
	} else if connection.IsPeer() {
		return result_source && result_target
	}

	return false

}
