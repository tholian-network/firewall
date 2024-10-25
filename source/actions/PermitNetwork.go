package actions

import "tholian-endpoint/adapters/mitigations/ebpf"
import "tholian-endpoint/adapters/mitigations/iptables"
import "tholian-endpoint/insights"
import "tholian-endpoint/matchers"
import "tholian-endpoint/structs"

func PermitNetwork(system *structs.System, search matchers.Network) bool {

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
