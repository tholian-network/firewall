package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"

func PermitNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for s := 0; s < len(network.Sockets); s++ {

			socket := network.Sockets[s]

			if isForbidden(socket) {

				console.Info("adapters/ebpf: Permit Network \"" + socket.Host + "\"")
				result = forbid(socket)

			} else {

				result = true

			}

		}

	}

	return result

}
