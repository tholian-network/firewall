package module

import "github.com/cilium/ebpf"

func PermitPort(port uint16) bool {

	var result bool = false

	if port > 0 && port < 65535 && port != 22 {

		if Module.PortBans != nil {

			err := Module.PortBans.Delete(ToBPFPort(port))

			if err == nil {
				result = true
			} else if err == ebpf.ErrKeyNotExist {
				result = true
			}

		}

	}

	return result

}
