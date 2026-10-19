//go:build guard_netbsd

package ebpf

import "tholian-core/structs"

var SUPPORTED bool

func Init(console *structs.Console) {
	SUPPORTED = false
}

func IsSupported() bool {
	return SUPPORTED
}

func Close() {
	SUPPORTED = false
}
