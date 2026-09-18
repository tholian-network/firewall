//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"
import "tholian-firewall/types"
import "encoding/binary"
import "strconv"
import "net"

func ForbidAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {

		if module.ForbidAddress(console, address) == false {
			return false
		}

		resolved, err := net.LookupIP(address)

		if err == nil {
			for r := 0; r < len(resolved); r++ {
				module.ForbidAddress(console, resolved[r].String())
			}
		}

		return true

	}

	return module.ForbidAddress(console, address)

}

func PermitAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {

		result := module.PermitAddress(console, address)
		resolved, err := net.LookupIP(address)

		if err == nil {
			for r := 0; r < len(resolved); r++ {
				module.PermitAddress(console, resolved[r].String())
			}
		}

		return result

	}

	return module.PermitAddress(console, address)

}

func IsForbiddenAddress(console *structs.Console, address string) bool {
	return module.IsForbiddenAddress(console, address)
}

func ForbidSubnet(console *structs.Console, address string, prefix uint8) bool {
	return module.ForbidSubnet(console, address, prefix)
}

func PermitSubnet(console *structs.Console, address string, prefix uint8) bool {
	return module.PermitSubnet(console, address, prefix)
}

func IsForbiddenSubnet(console *structs.Console, address string, prefix uint8) bool {
	return module.IsForbiddenSubnet(console, address, prefix)
}

func ForbidPort(console *structs.Console, port uint16) bool {
	return module.ForbidPort(console, port)
}

func PermitPort(console *structs.Console, port uint16) bool {
	return module.PermitPort(console, port)
}

func IsForbiddenPort(console *structs.Console, port uint16) bool {
	return module.IsForbiddenPort(console, port)
}

func Status() []string {

	var result []string

	if SUPPORTED == false {
		return result
	}

	if module.Module.PortBans != nil {

		iterator := module.Module.PortBans.Iterate()
		var key uint16
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 {
				result = append(result, "port "+strconv.Itoa(int(key)))
			}

		}

	}

	if module.Module.IPv4Bans != nil {

		iterator := module.Module.IPv4Bans.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 8 {
				prefix := binary.NativeEndian.Uint32(key[0:4])
				result = append(result, net.IP(key[4:8]).String()+"/"+strconv.Itoa(int(prefix)))
			}

		}

	}

	if module.Module.IPv6Bans != nil {

		iterator := module.Module.IPv6Bans.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 20 {
				prefix := binary.NativeEndian.Uint32(key[0:4])
				result = append(result, net.IP(key[4:20]).String()+"/"+strconv.Itoa(int(prefix)))
			}

		}

	}

	return result

}
