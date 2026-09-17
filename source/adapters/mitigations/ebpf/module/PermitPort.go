package module

import "github.com/cilium/ebpf"
import "errors"

func PermitPort(port uint16) bool {

	var result bool = false

	if port > 0 && port < 65535 {

		if Module.PortBans != nil {

			err := Module.PortBans.Delete(ToBPFPort(port))

			if err == nil {
				result = true
			} else if errors.Is(err, ebpf.ErrKeyNotExist) {
				result = true
			}

		}

	}

	return result

}
