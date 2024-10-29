package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"

func PermitConnection(search matchers.Connection) bool {

	var result bool = false

	console.Group("actions/PermitConnection")

	connection := types.NewConnection()

	if search.Type == "client" {

		if search.Socket.Host == "any" {

			// Do Nothing

		} else if types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket("[0000:0000:0000:0000:0000:0000:0000:0000]", search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("client")

		} else if types.IsIPv4(search.Socket.Host) {

			connection.SetSource(types.NewSocket("0.0.0.0", search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("client")

		} else if types.IsDomain(search.Socket.Host) {

			connection.SetSource(types.NewSocket(".arpa", search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("client")

		}

	} else if search.Type == "server" {

		if search.Socket.Host == "any" {

			if search.Socket.Port != 0 {

				connection.SetSource(types.NewSocket("*", search.Socket.Port))
				connection.SetTarget(types.NewSocket("*", search.Socket.Port))
				connection.SetType("server")

			}

		} else if types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket("[0000:0000:0000:0000:0000:0000:0000:0000]", search.Socket.Port))
			connection.SetType("server")

		} else if types.IsIPv4(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket("0.0.0.0", search.Socket.Port))
			connection.SetType("server")

		} else if types.IsDomain(search.Socket.Host) {

			connection.SetSource(types.NewSocket(".arpa", search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("server")

		}

	} else if search.Type == "peer" {

		if search.Socket.Host == "any" {

			if search.Socket.Port != 0 {

				connection.SetSource(types.NewSocket("*", search.Socket.Port))
				connection.SetTarget(types.NewSocket("*", search.Socket.Port))
				connection.SetType("peer")

			}

		} else if types.IsIPv4(search.Socket.Host) || types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("peer")

		} else if types.IsDomain(search.Socket.Host) {

			connection.SetSource(types.NewSocket(".arpa", search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType("peer")

		}

	}

	if connection.IsValid() {

		if ebpf.SUPPORTED == true {

			if ebpf.PermitConnection(connection) == true {
				result = true
			}

		} else if iptables.SUPPORTED == true {

			if iptables.PermitConnection(connection) == true {
				result = true
			}

		}

	}

	console.GroupEndResult(result, "actions/PermitConnection")

	return result

}
