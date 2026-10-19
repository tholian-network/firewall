//go:build guard_freebsd

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
