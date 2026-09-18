//go:build intel

package ebpf

import "tholian-firewall/structs"

func PermitNetwork(console *structs.Console, network structs.Network) bool {
	return false
}
