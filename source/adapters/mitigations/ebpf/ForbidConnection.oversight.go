//go:build oversight

package ebpf

import "tholian-firewall/structs"
import "tholian-firewall/types"

func ForbidConnection(console *structs.Console, connection types.Connection) bool {
	return false
}
