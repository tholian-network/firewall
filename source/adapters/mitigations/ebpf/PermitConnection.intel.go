//go:build intel

package ebpf

import "tholian-endpoint/types"

func PermitConnection(connection types.Connection) bool {
	return false
}
