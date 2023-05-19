package ebpf

import "github.com/cilium/ebpf"
import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strings"

func isForbiddenIPv4(key string) bool {

	var result bool = false

	if isIPv4(key) == true {

		if BPF.IPv4Bans != nil {

			var value uint8;

			err := BPF.IPv4Bans.Lookup(toIPv4(key), &value)

			if err == nil {

				if value == 1 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	}

	return result

}

func isForbiddenIPv6(key string) bool {

	var result bool = false

	if isIPv6(key) == true {

		if BPF.IPv6Bans != nil {

			var value uint8;

			err := BPF.IPv6Bans.Lookup(toIPv6(key), &value)

			if err == nil {

				if value == 1 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	}

	return result

}

func ForbidNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for a := 0; a < len(network.Addresses); a++ {

			shost := network.Addresses[a].IP

			if isIPv6(shost) {

				if isForbiddenIPv6(shost) {

					result = true

				} else {

					if strings.HasPrefix(shost, "[") && strings.HasSuffix(shost, "]") {
						console.Warn("adapters/ebpf: Forbid Network \"" + shost + "\"")
					} else {
						console.Warn("adapters/ebpf: Forbid Network \"[" + shost + "]\"")
					}

					if BPF.IPv6Bans != nil {

						err := BPF.IPv6Bans.Update(toIPv6(shost), uint8(1), ebpf.UpdateAny)

						if err == nil {
							result = true
						}

					}

				}

			} else if isIPv4(shost) {

				if isForbiddenIPv4(shost) {

					result = true

				} else {

					console.Warn("adapters/ebpf: Forbid Network \"" + shost + "\"")

					if BPF.IPv4Bans != nil {

						err := BPF.IPv4Bans.Update(toIPv4(shost), uint8(1), ebpf.UpdateAny)

						if err == nil {
							result = true
						}

					}

				}

			}

		}

	}

	return result

}
