package iptables

import "tholian-endpoint/console"
import "tholian-endpoint/types"
import "strconv"

func ForbidConnection(connection types.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		result_source := false
		result_target := false

		if connection.Type == "client" || connection.Type == "peer" {

			// local client is connecting to remote server

			if connection.Target.Host == "*" {

				if connection.Target.Port != 0 {

					if isForbiddenPort("OUTPUT", connection.Target.Port) {
						result_target = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"*:" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = forbidPort("OUTPUT", connection.Target.Port)
					}

				}

			} else {

				if connection.Target.Port != 0 {

					if isForbiddenHostAndPort("OUTPUT", connection.Target.Host, connection.Target.Port) {
						result_target = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = forbidHostAndPort("OUTPUT", connection.Target.Host, connection.Target.Port)
					}

				} else if connection.Target.Port == 0 {

					if isForbiddenHost("OUTPUT", connection.Target.Host) {
						result_target = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"" + connection.Target.Host + ":*\"")
						result_target = forbidHost("OUTPUT", connection.Target.Host)
					}

				}

			}

		}

		if connection.Type == "server" || connection.Type == "peer" {

			// remote client is connecting to local server

			if connection.Source.Host == "*" {

				if connection.Source.Port != 0 {

					if isForbiddenPort("INPUT", connection.Source.Port) {
						result_source = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"*:" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = forbidPort("INPUT", connection.Source.Port)
					}

				}

			} else {

				if connection.Source.Port != 0 {

					if isForbiddenHostAndPort("INPUT", connection.Source.Host, connection.Source.Port) {
						result_source = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = forbidHostAndPort("INPUT", connection.Source.Host, connection.Source.Port)
					}

				} else if connection.Source.Port == 0 {

					if isForbiddenHost("INPUT", connection.Source.Host) {
						result_source = true
					} else {
						console.Warn("adapters/iptables: Forbid Connection \"" + connection.Source.Host + ":*\"")
						result_source = forbidHost("INPUT", connection.Source.Host)
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
