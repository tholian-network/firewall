package module

import "github.com/cilium/ebpf"
import "tholian-firewall/types"
import "tholian-firewall/structs"
import "errors"

func IsForbiddenAddress(console *structs.Console, address string) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if Module.IPv6Bans != nil {

			var value uint8

			err := Module.IPv6Bans.Lookup(ToBPFIPv6(address, 128), &value)

			if err == nil {

				if value != 0 {
					result = true
				}

			} else if errors.Is(err, ebpf.ErrKeyNotExist) {
				result = false
			}

		}

	} else if types.IsIPv4(address) {

		if Module.IPv4Bans != nil {

			var value uint8

			err := Module.IPv4Bans.Lookup(ToBPFIPv4(address, 32), &value)

			if err == nil {

				if value != 0 {
					result = true
				}

			} else if errors.Is(err, ebpf.ErrKeyNotExist) {
				result = false
			}

		}

	} else if types.IsDomain(address) {

		if Module.DomainBans != nil {

			var value uint8

			err := Module.DomainBans.Lookup(ToBPFDomain(address), &value)

			if err == nil {

				if value != 0 {
					result = true
				}

			} else if errors.Is(err, ebpf.ErrKeyNotExist) {
				result = false
			}

		}

	}

	return result

}
