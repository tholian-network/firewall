//go:build guard_openbsd

package ebpf

import "tholian-core/structs"
import "tholian-core/types"

func PermitConnection(console *structs.Console, connection types.Connection) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}
