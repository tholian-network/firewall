//go:build oversight

package ebpf

import "tholian-core/structs"
import "tholian-core/types"

func ForbidConnection(console *structs.Console, connection types.Connection) bool {
	return false
}
