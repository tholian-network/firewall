package actions

import "tholian-firewall/insights"
import "tholian-core/matchers"
import "tholian-core/structs"

func PermitNetwork(console *structs.Console, search matchers.Network) bool {

	var result bool = false

	if search.HasName() {

		network := insights.Internet.SearchASN(search.Name)

		if network.IsValid() {

			if permitNetwork(console, network) == true {
				result = true
			}

		}

	} else if search.HasSubnet() {

		subnet := structs.ToSubnet(search.Subnet)

		if subnet.IsValid() {

			if permitSubnetOrAddress(console, subnet) == true {
				result = true
			}

		}

	}

	return result

}
