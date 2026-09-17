//go:build intel

package ebpf

import "tholian-firewall/structs"

func ForbidNetwork(network structs.Network) bool {
	return false
}
