//go:build guard_netbsd

package ebpf

import "tholian-firewall/structs"

var SUPPORTED bool

func Init(console *structs.Console) {
	SUPPORTED = false
}
