//go:build oversight

package ebpf

var SUPPORTED bool

func init() {
	SUPPORTED = false
}
