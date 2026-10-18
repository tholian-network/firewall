package iptables

import "tholian-firewall/structs"
import "tholian-firewall/types"
import "strconv"

func permitEndpoint(console *structs.Console, chain string, socket types.Socket) bool {

	if socket.IsAny() {

		if socket.HasPort() {

			if isForbiddenPort(console, chain, socket.Port) == false {
				return true
			}

			console.Info("adapters/iptables: Permit Connection \"*:" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return permitPort(console, chain, socket.Port)

		}

		return false

	}

	if socket.HasHost() {

		if socket.HasPort() {

			if isForbiddenHostAndPort(console, chain, socket.Host, socket.Port) == false {
				return true
			}

			console.Info("adapters/iptables: Permit Connection \"" + socket.Host + ":" + strconv.FormatUint(uint64(socket.Port), 10) + "\"")

			return permitHostAndPort(console, chain, socket.Host, socket.Port)

		}

		if isForbiddenHost(console, chain, socket.Host) == false {
			return true
		}

		console.Info("adapters/iptables: Permit Connection \"" + socket.Host + ":*\"")

		return permitHost(console, chain, socket.Host)

	}

	return false

}

func PermitConnection(console *structs.Console, connection types.Connection) bool {

	if SUPPORTED == false {
		return false
	}

	result_source := false
	result_target := false

	if connection.IsClient() || connection.IsPeer() {
		result_target = permitEndpoint(console, "OUTPUT", connection.Target)
	}

	if connection.IsServer() || connection.IsPeer() {
		result_source = permitEndpoint(console, "INPUT", connection.Source)
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
