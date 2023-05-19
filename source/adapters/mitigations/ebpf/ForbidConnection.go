package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strconv"

func ForbidConnection(connection structs.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		if connection.Type == "client" {

			// local client is connecting to remote server

			if isForbidden(connection.Target) {

				result = true

			} else {

				if connection.Target.Port != 0 {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Target.Host + ":*\"")
				}

				result = forbid(connection.Target)

			}

		} else if connection.Type == "server" {

			// remote client is connecting to local server

			if isForbidden(connection.Source) {

				result = true

			} else {

				if connection.Source.Port != 0 {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Source.Host + ":*\"")
				}

				result = forbid(connection.Source)

			}

		} else if connection.Type == "peer" {

			var result_source bool = false
			var result_target bool = false

			if isForbidden(connection.Source) {

				result_source = true

			} else {

				if connection.Source.Port != 0 {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Source.Host + ":*\"")
				}

				result_source = forbid(connection.Source)

			}

			if isForbidden(connection.Target) {

				result_target = true

			} else {

				if connection.Target.Port != 0 {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
				} else {
					console.Warn("adapters/ebpf: Forbid Connection \"" + connection.Target.Host + ":*\"")
				}

				result_target = forbid(connection.Target)

			}

			if result_source == true && result_target == true {
				result = true
			}

		}

	}

	return result

}
