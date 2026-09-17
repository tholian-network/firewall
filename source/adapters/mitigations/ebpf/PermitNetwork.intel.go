//go:build intel

package ebpf

import "tholian-firewall/structs"

func PermitNetwork(network structs.Network) bool {
	return false
}
