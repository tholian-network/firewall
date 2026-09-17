package actions

import "tholian-firewall/insights"
import "tholian-firewall/matchers"
import "tholian-firewall/structs"

func PermitNetwork(search matchers.Network) bool {

	var result bool = false

	if search.Name != "" && search.Name != "any" {

		network := insights.Internet.SearchASN(search.Name)

		if network.IsValid() {

			if permitNetwork(network) == true {
				result = true
			}

		}

	} else if search.Subnet != "" && search.Subnet != "any" {

		subnet := structs.ToSubnet(search.Subnet)

		if subnet.IsValid() {

			if permitSubnetOrAddress(subnet) == true {
				result = true
			}

		}

	}

	return result

}
