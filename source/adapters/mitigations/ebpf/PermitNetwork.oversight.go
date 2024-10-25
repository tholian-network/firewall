//go:build oversight

package ebpf

import "tholian-endpoint/structs"

func PermitNetwork(network structs.Network) bool {
	return false
}
