//go:build oversight

package ebpf

import "tholian-endpoint/types"

func ForbidConnection(connection types.Connection) bool {
	return false
}
