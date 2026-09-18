//go:build oversight

package ebpf

import "tholian-firewall/structs"

func Detach(console *structs.Console, name string) bool {
	return false
}
