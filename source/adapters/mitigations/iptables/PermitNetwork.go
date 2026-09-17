package iptables

import "tholian-firewall/console"
import "tholian-firewall/structs"
import "strconv"

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true && len(network.Subnets) > 0 {

		result = true

		chains := []string{"INPUT", "OUTPUT"}

		for s := 0; s < len(network.Subnets); s++ {

			subnet := network.Subnets[s]

			for c := 0; c < len(chains); c++ {

				if isForbiddenSubnet(chains[c], subnet.Address, subnet.Prefix) == false {
					continue
				}

				console.Info("adapters/iptables: Permit Network \"" + chains[c] + " " + subnet.Address + "/" + strconv.FormatUint(uint64(subnet.Prefix), 10) + "\"")

				if permitSubnet(chains[c], subnet.Address, subnet.Prefix) == false {
					result = false
				}

			}

		}

	}

	return result

}
