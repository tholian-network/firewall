//go:build oversight

package ebpf

import "tholian-firewall/structs"

func Attach(console *structs.Console, name string) bool {
	return false
}
