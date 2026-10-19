//go:build guard_freebsd

package ebpf

import "tholian-core/structs"
import "tholian-core/types"

func ForbidConnection(console *structs.Console, connection types.Connection) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}
