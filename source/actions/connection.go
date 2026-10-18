package actions

import "tholian-firewall/matchers"
import "tholian-firewall/types"

func buildConnection(search matchers.Connection) types.Connection {

	connection := types.NewConnection()

	if search.Type == matchers.ConnectionTypeClient {

		if search.IsWildcard() {

			// Do Nothing

		} else if types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket(types.UnspecifiedIPv6, search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType(types.ConnectionTypeClient)

		} else if types.IsIPv4(search.Socket.Host) {

			connection.SetSource(types.NewSocket(types.UnspecifiedIPv4, search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType(types.ConnectionTypeClient)

		}

	} else if search.Type == matchers.ConnectionTypeServer {

		if search.IsWildcard() {

			if search.HasPort() {

				connection.SetSource(types.NewSocket(types.HostWildcard, search.Socket.Port))
				connection.SetTarget(types.NewSocket(types.HostWildcard, search.Socket.Port))
				connection.SetType(types.ConnectionTypeServer)

			}

		} else if types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket(types.UnspecifiedIPv6, search.Socket.Port))
			connection.SetType(types.ConnectionTypeServer)

		} else if types.IsIPv4(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket(types.UnspecifiedIPv4, search.Socket.Port))
			connection.SetType(types.ConnectionTypeServer)

		}

	} else if search.Type == matchers.ConnectionTypePeer {

		if search.IsWildcard() {

			if search.HasPort() {

				connection.SetSource(types.NewSocket(types.HostWildcard, search.Socket.Port))
				connection.SetTarget(types.NewSocket(types.HostWildcard, search.Socket.Port))
				connection.SetType(types.ConnectionTypePeer)

			}

		} else if types.IsIPv4(search.Socket.Host) || types.IsIPv6(search.Socket.Host) {

			connection.SetSource(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetTarget(types.NewSocket(search.Socket.Host, search.Socket.Port))
			connection.SetType(types.ConnectionTypePeer)

		}

	}

	return connection

}
