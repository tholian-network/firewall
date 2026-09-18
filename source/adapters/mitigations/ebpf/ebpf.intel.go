//go:build intel

package ebpf

import "tholian-firewall/structs"

var SUPPORTED bool

func Init(console *structs.Console) {
	SUPPORTED = false
}
