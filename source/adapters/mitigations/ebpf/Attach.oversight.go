//go:build oversight

package ebpf

import "tholian-core/structs"

func Attach(console *structs.Console, name string) bool {
	return false
}
