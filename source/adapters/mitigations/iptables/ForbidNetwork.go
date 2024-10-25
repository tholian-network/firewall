package iptables

import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strconv"

func ForbidNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for s := 0; s < len(network.Subnets); s++ {

			subnet := network.Subnets[s]

			if isForbiddenSubnet("INPUT", subnet.Address, subnet.Prefix) {

				result = true

			} else {

				console.Warn("adapters/iptables: Forbid Network \"" + subnet.Address + "/" + strconv.FormatUint(uint64(subnet.Prefix), 10) + "\"")
				result = forbidSubnet("INPUT", subnet.Address, subnet.Prefix)

			}

		}

	}

	return result

}
