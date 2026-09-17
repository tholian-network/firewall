//go:build intel

package ebpf

import "tholian-firewall/types"

func ForbidConnection(connection types.Connection) bool {
	return false
}
