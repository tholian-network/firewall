package ebpf

import "github.com/cilium/ebpf"
import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strings"

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for a := 0; a < len(network.Addresses); a++ {

			shost := network.Addresses[a].IP

			if isIPv6(shost) {

				if isForbiddenIPv6(shost) {

					if strings.HasPrefix(shost, "[") && strings.HasSuffix(shost, "]") {
						console.Info("adapters/ebpf: Permit Network \"" + shost + "\"")
					} else {
						console.Info("adapters/ebpf: Permit Network \"[" + shost + "]\"")
					}

					if BPF.IPv6Bans != nil {

						err := BPF.IPv6Bans.Delete(toIPv6(shost))

						if err == nil {
							result = true
						} else if err == ebpf.ErrKeyNotExist {
							result = true
						}

					}

				} else {

					result = true

				}

			} else if isIPv4(shost) {

				if isForbiddenIPv4(shost) {

					console.Info("adapters/ebpf: Permit Network \"" + shost + "\"")

					if BPF.IPv4Bans != nil {

						err := BPF.IPv4Bans.Delete(toIPv4(shost))

						if err == nil {
							result = true
						} else if err == ebpf.ErrKeyNotExist {
							result = true
						}

					}

				} else {

					result = true

				}

			}

		}

	}

	return result

}
