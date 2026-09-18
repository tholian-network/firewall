//go:build guard_freebsd

package ebpf

import "tholian-firewall/structs"

var SUPPORTED bool

func Init(console *structs.Console) {
	SUPPORTED = false
}
