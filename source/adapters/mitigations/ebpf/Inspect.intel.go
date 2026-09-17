//go:build intel

package ebpf

func ForbidAddress(address string) bool {
	return false
}

func PermitAddress(address string) bool {
	return false
}

func IsForbiddenAddress(address string) bool {
	return false
}

func ForbidSubnet(address string, prefix uint8) bool {
	return false
}

func PermitSubnet(address string, prefix uint8) bool {
	return false
}

func IsForbiddenSubnet(address string, prefix uint8) bool {
	return false
}

func ForbidPort(port uint16) bool {
	return false
}

func PermitPort(port uint16) bool {
	return false
}

func IsForbiddenPort(port uint16) bool {
	return false
}

func AttachAll() int {
	return 0
}

func Status() []string {
	return nil
}
