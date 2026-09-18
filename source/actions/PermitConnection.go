package actions

import "tholian-firewall/structs"
import "tholian-firewall/matchers"
import "tholian-firewall/types"

func PermitConnection(console *structs.Console, search matchers.Connection) bool {

	var result bool = false

	console.Group("actions/PermitConnection")

	if types.IsDomain(search.Socket.Host) == true {

		result = permitDomain(console, search.Socket.Host)

	} else {

		connection := buildConnection(search)

		if connection.IsValid() == true {
			result = permitConnection(console, connection)
		}

	}

	console.GroupEndResult(result, "actions/PermitConnection")

	return result

}
