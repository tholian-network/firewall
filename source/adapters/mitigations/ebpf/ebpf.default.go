//go:build !guard && !guard_openwrt && !guard_almalinux && !guard_alpinelinux && !guard_amazonlinux && !guard_antergos && !guard_archlinux && !guard_cblmariner && !guard_centos && !guard_debian && !guard_fedora && !guard_gentoolinux && !guard_linuxmint && !guard_manjaro && !guard_opensuse && !guard_oraclelinux && !guard_photonos && !guard_redhat && !guard_rockylinux && !guard_trisquel && !guard_ubuntu && !guard_freebsd && !guard_netbsd && !guard_openbsd && !intel && !oversight

package ebpf

import "tholian-firewall/structs"
import "tholian-firewall/types"

var SUPPORTED bool

func Init(console *structs.Console) {
	SUPPORTED = false
}

func IsSupported() bool {
	return false
}

func Close() {
}

func Attach(console *structs.Console, name string) bool {
	return false
}

func AttachAll(console *structs.Console) int {
	return 0
}

func Detach(console *structs.Console, name string) bool {
	return false
}

func DetachAll(console *structs.Console) int {
	return 0
}

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

func ForbidSocket(console *structs.Console, address string, port uint16) bool {
	return false
}

func PermitSocket(console *structs.Console, address string, port uint16) bool {
	return false
}

func IsForbiddenSocket(console *structs.Console, address string, port uint16) bool {
	return false
}

func ForbidNetwork(console *structs.Console, network structs.Network) bool {
	return false
}

func PermitNetwork(console *structs.Console, network structs.Network) bool {
	return false
}

func ForbidConnection(console *structs.Console, connection types.Connection) bool {
	return false
}

func PermitConnection(console *structs.Console, connection types.Connection) bool {
	return false
}

func Status() []string {
	return nil
}
