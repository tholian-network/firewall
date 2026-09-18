//go:build oversight

package ebpf

import "tholian-firewall/structs"
import "tholian-firewall/types"

func PermitConnection(console *structs.Console, connection types.Connection) bool {
	return false
}
