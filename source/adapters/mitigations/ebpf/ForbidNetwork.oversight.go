//go:build oversight

package ebpf

import "tholian-core/structs"

func ForbidNetwork(console *structs.Console, network structs.Network) bool {
	return false
}
