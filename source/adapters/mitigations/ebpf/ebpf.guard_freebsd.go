//go:build guard_freebsd

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
