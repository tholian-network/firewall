package ebpf

import "tholian-endpoint/console"
import "tholian-endpoint/structs"
import "strconv"

func PermitConnection(connection structs.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		if connection.Type == "client" {

			// local client is connecting to remote server

			if isForbidden(connection.Target) {

				if connection.Target.Port != 0 {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
				} else {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Target.Host + ":*\"")
				}

				result = permit(connection.Target)

			} else {

				result = true

			}

		} else if connection.Type == "server" {

			// remote client is connecting to local server

			if isForbidden(connection.Source) {

				if connection.Source.Port != 0 {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
				} else {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Source.Host + ":*\"")
				}

				result = permit(connection.Source)

			} else {

				result = true

			}

		} else if connection.Type == "peer" {

			var result_source bool = false
			var result_target bool = false

			if isForbidden(connection.Source) {

				if connection.Source.Port != 0 {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
				} else {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Source.Host + ":*\"")
				}

				result_source = permit(connection.Source)

			} else {

				result_source = true

			}

			if isForbidden(connection.Target) {

				if connection.Target.Port != 0 {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
				} else {
					console.Info("adapters/ebpf: Permit Connection \"" + connection.Target.Host + ":*\"")
				}

				result_target = permit(connection.Target)

			} else {

				result_target = true

			}

			if result_source == true && result_target == true {
				result = true
			}

		}

	}

	return result

}
