package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"

func forbid(ip string, port uint16) bool {

	var result bool = false

	// TODO: BPF map create new entry

	return result

}

func isForbidden(ip string) bool {

	var result bool = false

	// TODO: Implement this using the BPF MAP lookups

	if isIPv6(ip) == true {

		// TODO: BPF map lookup for ipv6_bans

	} else if isIPv4(ip) == true {

		// TODO: BPF map lookup for ipv4_bans

	} else if isDomain(ip) == true {

		// TODO: BPF map lookup for domain_bans

	}

	return result

}

func ForbidNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for a := 0; a < len(network.Addresses); a++ {

			shost := network.Addresses[a].IP
			sport := uint16(0)

			if isForbidden(shost) {

				result = true

			} else {

				console.Info("adapters/ebpf: Forbid Network \"" + shost + "\"")
				result = forbid(shost, sport)

			}

		}

	}

	return result

}
