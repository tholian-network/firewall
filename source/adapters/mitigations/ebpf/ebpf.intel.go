//go:build intel

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
