package module

import "github.com/cilium/ebpf"
import "tholian-firewall/types"

func PermitAddress(address string) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if Module.IPv6Bans != nil {

			err := Module.IPv6Bans.Delete(ToBPFIPv6(address, 128))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	} else if types.IsIPv4(address) {

		if Module.IPv4Bans != nil {

			err := Module.IPv4Bans.Delete(ToBPFIPv4(address, 32))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	} else if types.IsDomain(address) {

		if Module.DomainBans != nil {

			err := Module.DomainBans.Delete(ToBPFDomain(address))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	}

	return result

}
