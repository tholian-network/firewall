//go:build guard_openbsd

package ebpf

import "tholian-firewall/structs"

func ForbidAddress(console *structs.Console, address string) bool {
	return false
}

func PermitAddress(console *structs.Console, address string) bool {
	return false
}

func IsForbiddenAddress(console *structs.Console, address string) bool {
	return false
}

func ForbidSubnet(console *structs.Console, address string, prefix uint8) bool {
	return false
}

func PermitSubnet(console *structs.Console, address string, prefix uint8) bool {
	return false
}

func IsForbiddenSubnet(console *structs.Console, address string, prefix uint8) bool {
	return false
}

func ForbidPort(console *structs.Console, port uint16) bool {
	return false
}

func PermitPort(console *structs.Console, port uint16) bool {
	return false
}

func IsForbiddenPort(console *structs.Console, port uint16) bool {
	return false
}

func AttachAll(console *structs.Console) int {
	return 0
}

func Status() []string {
	return nil
}
