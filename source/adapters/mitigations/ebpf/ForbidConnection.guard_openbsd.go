//go:build guard_openbsd

package ebpf

import "tholian-endpoint/types"

func ForbidConnection(connection types.Connection) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}