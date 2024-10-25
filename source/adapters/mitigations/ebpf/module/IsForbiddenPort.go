package module

import "github.com/cilium/ebpf"

func IsForbiddenPort(port uint16) bool {

	var result bool = false

	if port > 0 && port < 65535 {

		if Module.PortBans != nil {

			var value uint8

			err := Module.PortBans.Lookup(ToBPFPort(port), &value)

			if err == nil {

				if value != 0 {
					result = true
				}

			} else if err == ebpf.ErrKeyNotExist {
				result = false
			}

		}

	}

	return result

}
