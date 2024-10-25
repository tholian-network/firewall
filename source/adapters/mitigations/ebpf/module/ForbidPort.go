package module

import "github.com/cilium/ebpf"
import "tholian-firewall/console"

func ForbidPort(port uint16) bool {

	var result bool = false

	if port > 0 && port < 65535 && port != 22 {

		if Module.PortBans != nil {

			err := Module.PortBans.Update(ToBPFPort(port), uint8(1), ebpf.UpdateAny)

			if err == nil {
				result = true
			} else {
				console.Error("adapters/ebpf: Port Ban Error")
				console.Error(err.Error())
			}

		}

	}

	return result

}
