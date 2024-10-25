//go:build oversight

package ebpf

import "tholian-endpoint/structs"

func ForbidNetwork(network structs.Network) bool {
	return false
}
