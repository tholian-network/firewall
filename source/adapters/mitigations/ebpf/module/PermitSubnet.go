package module

import "github.com/cilium/ebpf"
import "tholian-firewall/types"

func PermitSubnet(address string, prefix uint8) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if Module.IPv6Bans != nil {

			err := Module.IPv6Bans.Delete(ToBPFIPv6(address, prefix))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	} else if types.IsIPv4(address) {

		if Module.IPv4Bans != nil {

			err := Module.IPv4Bans.Delete(ToBPFIPv4(address, prefix))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	}

	return result

}
