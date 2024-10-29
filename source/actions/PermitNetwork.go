package actions

import "tholian-firewall/adapters/mitigations/ebpf"
import "tholian-firewall/adapters/mitigations/iptables"
import "tholian-firewall/insights"
import "tholian-firewall/matchers"
import "tholian-firewall/structs"

func PermitNetwork(search matchers.Network) bool {

	var result bool = false

	if ebpf.SUPPORTED == true {

		if search.Name != "" {

			network := insights.Internet.SearchASN(search.Name)

			if network.IsValid() {

				if ebpf.PermitNetwork(network) == true {
					result = true
				}

			}

		} else if search.Subnet != "" {

			subnet := insights.Internet.Search(search.Subnet)
			network := structs.NewNetwork(subnet.Name)
			network.AddSubnet(subnet)

			if network.IsValid() {

				if ebpf.PermitNetwork(network) == true {
					result = true
				}

			}

		}

	} else if iptables.SUPPORTED == true {

		if search.Name != "" {

			network := insights.Internet.SearchASN(search.Name)

			if network.IsValid() {

				if iptables.PermitNetwork(network) == true {
					result = true
				}

			}

		} else if search.Subnet != "" {

			subnet := insights.Internet.Search(search.Subnet)
			network := structs.NewNetwork(subnet.Name)
			network.AddSubnet(subnet)

			if network.IsValid() {

				if iptables.PermitNetwork(network) == true {
					result = true
				}

			}

		}

	}

	return result

}
