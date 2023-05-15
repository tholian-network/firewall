package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"

func permit(ip string, port uint16) bool {

	var result bool = false

	// TODO: BPF map remove existing entry

	return result

}

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for a := 0; a < len(network.Addresses); a++ {

			shost := network.Addresses[a].IP
			sport := uint16(0)

			if isForbidden(shost) {

				console.Info("adapters/ebpf: Permit Network \"" + shost + "\"")
				result = permit(shost, sport)

			} else {

				result = true

			}

		}

	}

	return result

}
