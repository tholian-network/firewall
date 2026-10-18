package actions

import "tholian-firewall/structs"
import "tholian-firewall/matchers"

func ForbidConnection(console *structs.Console, search matchers.Connection) bool {

	var result bool = false

	console.Group("actions/ForbidConnection")

	if search.IsDomain() == true {

		result = forbidDomain(console, search.Socket.Host)

	} else {

		connection := buildConnection(search)

		if connection.IsValid() == true {
			result = forbidConnection(console, connection)
		}

	}

	console.GroupEndResult(result, "actions/ForbidConnection")

	return result

}
