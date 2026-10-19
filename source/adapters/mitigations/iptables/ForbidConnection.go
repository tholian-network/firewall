package iptables

import "tholian-core/structs"
import "tholian-core/types"
import "strconv"

func forbidEndpoint(console *structs.Console, chain string, socket types.Socket) bool {

	if socket.IsAny() {

		if socket.HasPort() {

			if isForbiddenPort(console, chain, socket.Port) {
				return true
			}

			console.Warn("adapters/iptables: Forbid Connection \"*:" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return forbidPort(console, chain, socket.Port)

		}

		return false

	}

	if socket.HasHost() {

		if socket.HasPort() {

			if isForbiddenHostAndPort(console, chain, socket.Host, socket.Port) {
				return true
			}

			console.Warn("adapters/iptables: Forbid Connection \"" + socket.Host + ":" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return forbidHostAndPort(console, chain, socket.Host, socket.Port)

		}

		if isForbiddenHost(console, chain, socket.Host) {
			return true
		}

		console.Warn("adapters/iptables: Forbid Connection \"" + socket.Host + ":*\"")

		return forbidHost(console, chain, socket.Host)

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
		result_target = forbidEndpoint(console, "OUTPUT", connection.Target)
	}

	if connection.IsServer() || connection.IsPeer() {
		result_source = forbidEndpoint(console, "INPUT", connection.Source)
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
