//go:build guard_openbsd

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
