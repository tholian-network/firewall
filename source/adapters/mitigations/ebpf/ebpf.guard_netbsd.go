//go:build guard_netbsd

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
