//go:build intel

package ebpf

import "tholian-firewall/structs"

func ForbidNetwork(console *structs.Console, network structs.Network) bool {
	return false
}
