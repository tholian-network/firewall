//go:build intel

package ebpf

import "tholian-core/structs"
import "tholian-core/types"

func PermitConnection(console *structs.Console, connection types.Connection) bool {
	return false
}
