package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"
import "strconv"

func PermitConnections(searches []matchers.Connection) bool {

	var result bool = false

	console.Group("actions/PermitConnections")

	connections := make([]types.Connection, 0)
	remaining := make([]types.Connection, 0)

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if search.Type == "client" {

			connection := types.NewConnection()

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

			if connection.IsValid() {
				connections = append(connections, connection)
			}

		} else if search.Type == "server" {

			connection := types.NewConnection()

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

			if connection.IsValid() {
				connections = append(connections, connection)
			}

		} else if search.Type == "peer" {

			connection := types.NewConnection()

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

			if connection.IsValid() {
				connections = append(connections, connection)
			}

		}

	}

	if len(connections) > 0 {

		if ebpf.SUPPORTED == true {

			for c := 0; c < len(connections); c++ {

				connection := connections[c]

				if ebpf.PermitConnection(connection) {
					// Do Nothing
				} else {
					remaining = append(remaining, connection)
				}

			}

		} else if iptables.SUPPORTED == true {

			for c := 0; c < len(connections); c++ {

				connection := connections[c]

				if iptables.PermitConnection(connection) {
					// Do Nothing
				} else {
					remaining = append(remaining, connection)
				}

			}

		}

	}

	if len(remaining) == 0 {
		result = true
	} else {
		result = false
	}

	console.Log("Permitted " + strconv.Itoa(len(connections)-len(remaining)) + "/" + strconv.Itoa(len(connections)) + " Connections")
	console.GroupEndResult(result, "actions/PermitConnections")

	return result

}
