package iptables

import "tholian-firewall/console"
import "tholian-firewall/structs"
import "strconv"

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for s := 0; s < len(network.Subnets); s++ {

			subnet := network.Subnets[s]

			if isForbiddenSubnet("INPUT", subnet.Address, subnet.Prefix) {

				console.Info("adapters/iptables: Permit Network \"" + subnet.Address + "/" + strconv.FormatUint(uint64(subnet.Prefix), 10) + "\"")
				result = permitSubnet("INPUT", subnet.Address, subnet.Prefix)

			} else {

				result = true

			}

		}

	}

	return result

}
