package actions

import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"

func PermitConnection(search matchers.Connection) bool {

	var result bool = false

	console.Group("actions/PermitConnection")

	if types.IsDomain(search.Socket.Host) == true {

		result = permitDomain(search.Socket.Host)

	} else {

		connection := buildConnection(search)

		if connection.IsValid() == true {
			result = permitConnection(connection)
		}

	}

	console.GroupEndResult(result, "actions/PermitConnection")

	return result

}
