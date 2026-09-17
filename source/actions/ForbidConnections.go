package actions

import "tholian-firewall/console"
import "tholian-firewall/matchers"
import "tholian-firewall/types"
import "strconv"

func ForbidConnections(searches []matchers.Connection) bool {

	var result bool = false

	console.Group("actions/ForbidConnections")

	total := 0
	succeeded := 0

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if types.IsDomain(search.Socket.Host) == true {

			total = total + 1

			if forbidDomain(search.Socket.Host) == true {
				succeeded = succeeded + 1
			}

		} else {

			connection := buildConnection(search)

			if connection.IsValid() == true {

				total = total + 1

				if forbidConnection(connection) == true {
					succeeded = succeeded + 1
				}

			}

		}

	}

	result = succeeded == total

	console.Log("Forbidden " + strconv.Itoa(succeeded) + "/" + strconv.Itoa(total) + " Connections")
	console.GroupEndResult(result, "actions/ForbidConnections")

	return result

}
