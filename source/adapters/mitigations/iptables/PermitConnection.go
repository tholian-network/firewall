package iptables

import "tholian-firewall/structs"
import "tholian-firewall/types"
import "strconv"

func PermitConnection(console *structs.Console, connection types.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		result_source := false
		result_target := false

		if connection.Type == "client" || connection.Type == "peer" {

			// local client is connecting to remote server

			if connection.Target.Host == "*" {

				if connection.Target.Port != 0 {

					if isForbiddenPort(console, "OUTPUT", connection.Target.Port) {
						console.Info("adapters/iptables: Permit Connection \"*:" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = permitPort(console, "OUTPUT", connection.Target.Port)
					} else {
						result_target = true
					}

				}

			} else {

				if connection.Target.Port != 0 {

					if isForbiddenHostAndPort(console, "OUTPUT", connection.Target.Host, connection.Target.Port) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = permitHostAndPort(console, "OUTPUT", connection.Target.Host, connection.Target.Port)
					} else {
						result_target = true
					}

				} else if connection.Target.Port == 0 {

					if isForbiddenHost(console, "OUTPUT", connection.Target.Host) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Target.Host + ":*\"")
						result_target = permitHost(console, "OUTPUT", connection.Target.Host)
					} else {
						result_target = true
					}

				}

			}

		}

		if connection.Type == "server" || connection.Type == "peer" {

			// remote client is connecting to local server

			if connection.Source.Host == "*" {

				if connection.Source.Port != 0 {

					if isForbiddenPort(console, "INPUT", connection.Source.Port) {
						console.Info("adapters/iptables: Permit Connection \"*:" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = permitPort(console, "INPUT", connection.Source.Port)
					} else {
						result_source = true
					}

				}

			} else {

				if connection.Source.Port != 0 {

					if isForbiddenHostAndPort(console, "INPUT", connection.Source.Host, connection.Source.Port) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = permitHostAndPort(console, "INPUT", connection.Source.Host, connection.Source.Port)
					} else {
						result_source = true
					}

				} else if connection.Source.Port == 0 {

					if isForbiddenHost(console, "INPUT", connection.Source.Host) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Source.Host + ":*\"")
						result_source = permitHost(console, "INPUT", connection.Source.Host)
					} else {
						result_source = true
					}

				}

			}

		}

		if connection.Type == "client" {

			result = result_target

		} else if connection.Type == "server" {

			result = result_source

		} else if connection.Type == "peer" {

			if result_source == true && result_target == true {
				result = true
			}

		}

	}

	return result

}
