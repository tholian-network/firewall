//go:build intel

package ebpf

import "tholian-firewall/types"

func PermitConnection(connection types.Connection) bool {
	return false
}
