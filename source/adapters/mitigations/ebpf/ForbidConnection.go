package ebpf

import "github.com/cilium/ebpf"
import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strconv"
import "strings"

func ForbidConnection(connection structs.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		if connection.Type == "client" {

			// local client is connecting to remote server

			dhost := connection.Target.Host
			dport := connection.Target.Port

			if isIPv6(dhost) {

				if isForbiddenIPv6(dhost) {

					result = true

				} else {

					if strings.HasPrefix(dhost, "[") && strings.HasSuffix(dhost, "]") {
						console.Warn("adapters/ebpf: Forbid Connection \"" + dhost + ":" + strconv.FormatUint(uint64(dport), 10) + "\"")
					} else {
						console.Warn("adapters/ebpf: Forbid Connection \"[" + dhost + "]:" + strconv.FormatUint(uint64(dport), 10) + "\"")
					}

					if BPF.PortBans != nil {

						err := BPF.PortBans.Update(toPort(dport), uint8(1), ebpf.UpdateAny)

						if err == nil {
							result = true
						}

					}

				}

			} else if isIPv4(dhost) {

				if isForbiddenIPv4(dhost) {

					result = true

				} else {

					console.Info("adapters/ebpf: Forbid Connection \"" + dhost + ":" + strconv.FormatUint(uint64(dport), 10) + "\"")

					if BPF.PortBans != nil {

						err := BPF.PortBans.Update(toPort(dport), uint8(1), ebpf.UpdateAny)

						if err == nil {
							result = true
						}

					}

				}

			}

		} else if connection.Type == "server" {

			// remote client is connecting to local server

			shost := connection.Source.Host
			sport := connection.Source.Port

			if isIPv6(shost) {

				if isForbiddenIPv6(shost) {

					result = true

				} else {

					if strings.HasPrefix(shost, "[") && strings.HasSuffix(shost, "]") {
						console.Warn("adapters/ebpf: Forbid Connection \"" + shost + ":" + strconv.FormatUint(uint64(sport), 10) + "\"")
					} else {
						console.Warn("adapters/ebpf: Forbid Connection \"[" + shost + "]:" + strconv.FormatUint(uint64(sport), 10) + "\"")
					}

					if BPF.PortBans != nil {

						err := BPF.PortBans.Update(toPort(sport), uint8(1), ebpf.UpdateAny)

						if err == nil {
							result = true
						}

					}

				}

			} else if isIPv4(shost) {

				if isForbiddenIPv4(shost) {

					result = true

				} else {

					console.Info("adapters/ebpf: Forbid Connection \"" + shost + ":" + strconv.FormatUint(uint64(sport), 10) + "\"")

					if BPF.PortBans != nil {

						err := BPF.PortBans.Update(toPort(sport), uint8(1), ebpf.UpdateAny)

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
