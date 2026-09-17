package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/insights"
import "tholian-firewall/structs"

func Check(target string) bool {

	var result bool = false

	parsed := ParseTarget(target)

	if parsed.Kind == "connection" {

		if parsed.Connection.Socket.Host != "" && parsed.Connection.Socket.Host != "any" {
			if ebpf.IsForbiddenAddress(parsed.Connection.Socket.Host) {
				result = true
			}
		}

		if result == false && parsed.Connection.Socket.Port != 0 {
			if ebpf.IsForbiddenPort(parsed.Connection.Socket.Port) {
				result = true
			}
		}

	} else if parsed.Kind == "domain" {

		if ebpf.IsForbiddenAddress(parsed.Domain) {
			result = true
		}

	} else if parsed.Kind == "network" {

		if parsed.Network.Subnet != "" && parsed.Network.Subnet != "any" {

			subnet := structs.ToSubnet(parsed.Network.Subnet)

			if subnet.IsValid() {

				if ebpf.IsForbiddenSubnet(subnet.Address, subnet.Prefix) {
					result = true
				}

				if result == false && ebpf.IsForbiddenAddress(subnet.Address) {
					result = true
				}

			}

		} else if parsed.Network.Name != "" && parsed.Network.Name != "any" {

			network := insights.Internet.SearchASN(parsed.Network.Name)

			for s := 0; s < len(network.Subnets); s++ {

				if ebpf.IsForbiddenSubnet(network.Subnets[s].Address, network.Subnets[s].Prefix) {
					result = true
					break
				}

			}

		}

	}

	return result

}
