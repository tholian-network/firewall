package actions

import "tholian-firewall/insights"
import "tholian-firewall/structs"

func Check(console *structs.Console, target string) bool {

	var result bool = false

	parsed := ParseTarget(target)

	if parsed.Kind == "connection" {

		if parsed.Connection.Socket.Host != "" && parsed.Connection.Socket.Host != "any" {
			if isForbiddenAddress(console, parsed.Connection.Socket.Host) == true {
				result = true
			}
		}

		if result == false && parsed.Connection.Socket.Port != 0 {
			if isForbiddenPort(console, parsed.Connection.Socket.Port) == true {
				result = true
			}
		}

	} else if parsed.Kind == "domain" {

		if isForbiddenDomain(console, parsed.Domain) == true {
			result = true
		}

	} else if parsed.Kind == "network" {

		if parsed.Network.Subnet != "" && parsed.Network.Subnet != "any" {

			subnet := structs.ToSubnet(parsed.Network.Subnet)

			if subnet.IsValid() == true {

				if isForbiddenSubnetOrAddress(console, subnet) == true {
					result = true
				}

			}

		} else if parsed.Network.Name != "" && parsed.Network.Name != "any" {

			network := insights.Internet.SearchASN(parsed.Network.Name)

			for s := 0; s < len(network.Subnets); s++ {

				if isForbiddenSubnet(console, network.Subnets[s].Address, network.Subnets[s].Prefix) == true {
					result = true
					break
				}

			}

		}

	}

	return result

}
