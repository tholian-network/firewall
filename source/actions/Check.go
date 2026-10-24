package actions

import "tholian-firewall/insights"
import "tholian-firewall/internal/types"
import "tholian-core/structs"

func Check(console *structs.Console, target string) bool {

	var result bool = false

	parsed := types.ParseTarget(target)

	if parsed.IsConnection() {

		if parsed.Connection.HasHost() && parsed.Connection.HasPort() {
			if isForbiddenSocket(console, parsed.Connection.Socket.Host, parsed.Connection.Socket.Port) == true {
				result = true
			}
		}

		if result == false && parsed.Connection.HasHost() {
			if isForbiddenAddress(console, parsed.Connection.Socket.Host) == true {
				result = true
			}
		}

		if result == false && parsed.Connection.HasPort() {
			if isForbiddenPort(console, parsed.Connection.Socket.Port) == true {
				result = true
			}
		}

	} else if parsed.IsDomain() {

		if isForbiddenDomain(console, parsed.Domain) == true {
			result = true
		}

	} else if parsed.IsNetwork() {

		if parsed.Network.HasSubnet() {

			subnet := structs.ToSubnet(parsed.Network.Subnet)

			if subnet.IsValid() == true {

				if isForbiddenSubnetOrAddress(console, subnet) == true {
					result = true
				}

			}

		} else if parsed.Network.HasName() {

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
