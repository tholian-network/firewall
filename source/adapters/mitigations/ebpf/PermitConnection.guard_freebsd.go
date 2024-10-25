//go:build guard_freebsd

package ebpf

import "tholian-endpoint/types"

func PermitConnection(connection types.Connection) bool {

	var result bool = false

	// TODO: Not implemented yet

	return result

}
