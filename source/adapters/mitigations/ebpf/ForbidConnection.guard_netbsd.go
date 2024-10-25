//go:build guard_netbsd

package ebpf

import "tholian-endpoint/types"

func ForbidConnection(connection types.Connection) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}
