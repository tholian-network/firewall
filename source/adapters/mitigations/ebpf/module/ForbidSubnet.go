package module

import "github.com/cilium/ebpf"
import "tholian-firewall/console"
import "tholian-firewall/types"

func ForbidSubnet(address string, prefix uint8) bool {

	var result bool = false

	if types.IsIPv6(address) {

		if Module.IPv6Bans != nil {

			err := Module.IPv6Bans.Update(ToBPFIPv6(address, prefix), uint8(1), ebpf.UpdateAny)

			if err == nil {
				result = true
			} else {
				console.Error("adapters/ebpf: IPv6 Ban Error")
				console.Error(err.Error())
			}

		}

	} else if types.IsIPv4(address) {

		if Module.IPv4Bans != nil {

			err := Module.IPv4Bans.Update(ToBPFIPv4(address, prefix), uint8(1), ebpf.UpdateAny)

			if err == nil {
				result = true
			} else {
				console.Error("adapters/ebpf: IPv4 Ban Error")
				console.Error(err.Error())
			}

		}

	}

	return result

}
