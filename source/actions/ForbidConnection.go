package actions

import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"

func ForbidConnection(search matchers.Connection) bool {

	var result bool = false

	console.Group("actions/ForbidConnection")

	if types.IsDomain(search.Socket.Host) == true {

		result = forbidDomain(search.Socket.Host)

	} else {

		connection := buildConnection(search)

		if connection.IsValid() == true {
			result = forbidConnection(connection)
		}

	}

	console.GroupEndResult(result, "actions/ForbidConnection")

	return result

}
