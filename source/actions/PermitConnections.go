package actions

import "tholian-core/structs"
import "tholian-core/matchers"
import "strconv"

func PermitConnections(console *structs.Console, searches []matchers.Connection) bool {

	var result bool = false

	console.Group("actions/PermitConnections")

	total := 0
	succeeded := 0

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if search.IsDomain() == true {

			total = total + 1

			if permitDomain(console, search.Socket.Host) == true {
				succeeded = succeeded + 1
			}

		} else {

			connection := build_connection(search)

			if connection.IsValid() == true {

				total = total + 1

				if permitConnection(console, connection) == true {
					succeeded = succeeded + 1
				}

			}

		}

	}

	result = total > 0 && succeeded == total

	console.Log("Permitted " + strconv.Itoa(succeeded) + "/" + strconv.Itoa(total) + " Connections")
	console.GroupEndResult(result, "actions/PermitConnections")

	return result

}
