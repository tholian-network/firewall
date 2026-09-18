//go:build guard_netbsd

package ebpf

import "tholian-firewall/structs"

func ForbidNetwork(console *structs.Console, network structs.Network) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}
