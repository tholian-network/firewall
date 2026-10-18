package actions

import "tholian-firewall/structs"
import "tholian-firewall/matchers"
import "strconv"

func ForbidConnections(console *structs.Console, searches []matchers.Connection) bool {

	var result bool = false

	console.Group("actions/ForbidConnections")

	total := 0
	succeeded := 0

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if search.IsDomain() == true {

			total = total + 1

			if forbidDomain(console, search.Socket.Host) == true {
				succeeded = succeeded + 1
			}

		} else {

			connection := buildConnection(search)

			if connection.IsValid() == true {

				total = total + 1

				if forbidConnection(console, connection) == true {
					succeeded = succeeded + 1
				}

			}

		}

	}

	result = total > 0 && succeeded == total

	console.Log("Forbidden " + strconv.Itoa(succeeded) + "/" + strconv.Itoa(total) + " Connections")
	console.GroupEndResult(result, "actions/ForbidConnections")

	return result

}
