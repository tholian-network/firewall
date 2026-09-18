package actions

import "tholian-firewall/structs"
import "tholian-firewall/insights"
import "tholian-firewall/matchers"
import "strconv"

func PermitNetworks(console *structs.Console, searches []matchers.Network) bool {

	var result bool = false

	console.Group("actions/PermitNetworks")

	total := 0
	succeeded := 0

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if search.Name != "" && search.Name != "any" {

			network := insights.Internet.SearchASN(search.Name)

			if network.IsValid() {

				total = total + 1

				if permitNetwork(console, network) == true {
					succeeded = succeeded + 1
				}

			}

		} else if search.Subnet != "" && search.Subnet != "any" {

			subnet := structs.ToSubnet(search.Subnet)

			if subnet.IsValid() {

				total = total + 1

				if permitSubnetOrAddress(console, subnet) == true {
					succeeded = succeeded + 1
				}

			}

		}

	}

	result = succeeded == total

	console.Log("Permitted " + strconv.Itoa(succeeded) + "/" + strconv.Itoa(total) + " Networks")
	console.GroupEndResult(result, "actions/PermitNetworks")

	return result

}
