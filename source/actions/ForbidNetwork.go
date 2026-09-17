package actions

import "tholian-firewall/insights"
import "tholian-firewall/matchers"
import "tholian-firewall/structs"

func ForbidNetwork(search matchers.Network) bool {

	var result bool = false

	if search.Name != "" && search.Name != "any" {

		network := insights.Internet.SearchASN(search.Name)

		if network.IsValid() {

			if forbidNetwork(network) == true {
				result = true
			}

		}

	} else if search.Subnet != "" && search.Subnet != "any" {

		subnet := structs.ToSubnet(search.Subnet)

		if subnet.IsValid() {

			if forbidSubnetOrAddress(subnet) == true {
				result = true
			}

		}

	}

	return result

}
