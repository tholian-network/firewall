package module

import "github.com/cilium/ebpf"
import "tholian-firewall/types"

func IsForbiddenSubnet(address string, prefix uint8) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if prefix >= 8 && prefix < 128 {

			if Module.IPv6Bans != nil {

				var value uint8

				err := Module.IPv6Bans.Lookup(ToBPFIPv6(address, prefix), &value)

				if err == nil {

					if value != 0 {
						result = true
					}

				} else if err == ebpf.ErrKeyNotExist {
					result = false
				}

			}

		}

	} else if types.IsIPv4(address) {

		if prefix >= 8 && prefix < 32 {

			if Module.IPv4Bans != nil {

				var value uint8

				err := Module.IPv4Bans.Lookup(ToBPFIPv4(address, prefix), &value)

				if err == nil {

					if value != 0 {
						result = true
					}

				} else if err == ebpf.ErrKeyNotExist {
					result = false
				}

			}

		}

	}

	return result

}
