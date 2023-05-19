package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"

func ForbidNetwork(network structs.Network) bool {

	var result bool = false

	if SUPPORTED == true {

		for s := 0; s < len(network.Sockets); s++ {

			socket := network.Sockets[s]

			if isForbidden(socket) {

				result = true

			} else {

				console.Warn("adapters/ebpf: Forbid Network \"" + socket.Host + "\"")
				result = forbid(socket)

			}

		}

	}

	return result

}
