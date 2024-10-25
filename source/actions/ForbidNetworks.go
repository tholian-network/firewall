package actions

import "tholian-endpoint/adapters/mitigations/ebpf"
import "tholian-endpoint/adapters/mitigations/iptables"
import "tholian-endpoint/console"
import "tholian-endpoint/insights"
import "tholian-endpoint/matchers"
import "tholian-endpoint/structs"
import "strconv"

func ForbidNetworks(system *structs.System, searches []matchers.Network) bool {

	var result bool = false

	console.Group("actions/ForbidNetworks")

	networks := make([]structs.Network, 0)
	remaining := make([]structs.Network, 0)

	for s := 0; s < len(searches); s++ {

		search := searches[s]

		if search.Name != "" {

			network := insights.Internet.SearchASN(search.Name)

			if network.IsValid() {
				networks = append(networks, network)
			}

		} else if search.Subnet != "" {

			subnet := insights.Internet.Search(search.Subnet)
			network := structs.NewNetwork(subnet.Name)
			network.AddSubnet(subnet)

			if network.IsValid() {
				networks = append(networks, network)
			}

		}

	}

	if len(networks) > 0 {

		if ebpf.SUPPORTED == true {

			for n := 0; n < len(networks); n++ {

				network := networks[n]

				if ebpf.ForbidNetwork(network) {
					// Do Nothing
				} else {
					remaining = append(remaining, network)
				}

			}

		} else if iptables.SUPPORTED == true {

			for n := 0; n < len(networks); n++ {

				network := networks[n]

				if iptables.ForbidNetwork(network) {
					// Do Nothing
				} else {
					remaining = append(remaining, network)
				}

			}

		}

	}

	if len(remaining) == 0 {
		result = true
	} else {
		result = false
	}

	console.Log("Forbidden " + strconv.Itoa(len(networks)-len(remaining)) + "/" + strconv.Itoa(len(networks)) + " Networks")
	console.GroupEndResult(result, "actions/ForbidNetworks")

	return result

}
