//go:build guard || guard_openwrt || guard_almalinux || guard_alpinelinux || guard_amazonlinux || guard_antergos || guard_archlinux || guard_cblmariner || guard_centos || guard_debian || guard_fedora || guard_gentoolinux || guard_linuxmint || guard_manjaro || guard_opensuse || guard_oraclelinux || guard_photonos || guard_redhat || guard_rockylinux || guard_trisquel || guard_ubuntu

package ebpf

import "tholian-firewall/adapters/mitigations/ebpf/module"
import "tholian-firewall/structs"
import "tholian-firewall/types"
import "encoding/binary"
import "encoding/hex"
import "sort"
import "strconv"
import "net"
import "sync"

var resolvedDomainsMutex sync.Mutex
var resolvedDomains map[string][]string

func rememberResolvedAddresses(domain string, addresses []string) {

	resolvedDomainsMutex.Lock()
	defer resolvedDomainsMutex.Unlock()

	if resolvedDomains == nil {
		resolvedDomains = make(map[string][]string)
	}

	merged := resolvedDomains[domain]

	for _, address := range addresses {

		found := false

		for _, known := range merged {
			if known == address {
				found = true
				break
			}
		}

		if found == false {
			merged = append(merged, address)
		}

	}

	resolvedDomains[domain] = merged

}

func takeResolvedAddresses(domain string) ([]string, bool) {

	resolvedDomainsMutex.Lock()
	defer resolvedDomainsMutex.Unlock()

	addresses, ok := resolvedDomains[domain]

	if ok == true {
		delete(resolvedDomains, domain)
	}

	return addresses, ok

}

func ForbidAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {

		if module.ForbidAddress(console, address) == false {
			return false
		}

		resolved, err := net.LookupIP(address)

		if err != nil {
			console.Warn("adapters/ebpf: Cannot resolve \"" + address + "\": " + err.Error())
			return true
		}

		addresses := make([]string, 0, len(resolved))

		for r := 0; r < len(resolved); r++ {
			addresses = append(addresses, resolved[r].String())
			module.ForbidAddress(console, resolved[r].String())
		}

		rememberResolvedAddresses(address, addresses)

		return true

	}

	return module.ForbidAddress(console, address)

}

func PermitAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {

		result := module.PermitAddress(console, address)

		resolved, ok := takeResolvedAddresses(address)

		if ok == false {

			addresses, err := net.LookupIP(address)

			if err != nil {
				console.Warn("adapters/ebpf: Cannot resolve \"" + address + "\": " + err.Error())
				return result
			}

			resolved = make([]string, 0, len(addresses))

			for r := 0; r < len(addresses); r++ {
				resolved = append(resolved, addresses[r].String())
			}

		}

		for r := 0; r < len(resolved); r++ {
			module.PermitAddress(console, resolved[r])
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

func ForbidSocket(console *structs.Console, address string, port uint16) bool {
	return module.ForbidSocket(console, address, port)
}

func PermitSocket(console *structs.Console, address string, port uint16) bool {
	return module.PermitSocket(console, address, port)
}

func IsForbiddenSocket(console *structs.Console, address string, port uint16) bool {
	return module.IsForbiddenSocket(console, address, port)
}

func Status() []string {

	var result []string

	if SUPPORTED == false {
		return result
	}

	if module.Module.DomainBans != nil {

		iterator := module.Module.DomainBans.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 8 {
				result = append(result, "domain #"+hex.EncodeToString(key))
			}

		}

	}

	if module.Module.PortBans != nil {

		iterator := module.Module.PortBans.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 2 {
				port := binary.BigEndian.Uint16(key)
				result = append(result, "port "+strconv.Itoa(int(port)))
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

	if module.Module.IPv4Sockets != nil {

		iterator := module.Module.IPv4Sockets.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 6 {
				port := binary.BigEndian.Uint16(key[4:6])
				result = append(result, "socket "+net.IP(key[0:4]).String()+":"+strconv.Itoa(int(port)))
			}

		}

	}

	if module.Module.IPv6Sockets != nil {

		iterator := module.Module.IPv6Sockets.Iterate()
		var key []byte
		var value uint8

		for iterator.Next(&key, &value) {

			if value != 0 && len(key) == 18 {
				port := binary.BigEndian.Uint16(key[16:18])
				result = append(result, "socket "+net.IP(key[0:16]).String()+":"+strconv.Itoa(int(port)))
			}

		}

	}

	sort.Strings(result)

	return result

}
