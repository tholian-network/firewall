package iptables

import "tholian-endpoint/console"
import "tholian-endpoint/types"
import "strconv"

func PermitConnection(connection types.Connection) bool {

	var result bool = false

	if SUPPORTED == true {

		result_source := false
		result_target := false

		if connection.Type == "client" || connection.Type == "peer" {

			// local client is connecting to remote server

			if connection.Target.Host == "*" {

				if connection.Target.Port != 0 {

					if isForbiddenPort("OUTPUT", connection.Target.Port) {
						console.Info("adapters/iptables: Permit Connection \"*:" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = permitPort("OUTPUT", connection.Target.Port)
					} else {
						result_target = true
					}

				}

			} else {

				if connection.Target.Port != 0 {

					if isForbiddenHostAndPort("OUTPUT", connection.Target.Host, connection.Target.Port) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Target.Host + ":" + strconv.FormatUint(uint64(connection.Target.Port), 10) + "\"")
						result_target = permitHostAndPort("OUTPUT", connection.Target.Host, connection.Target.Port)
					} else {
						result_target = true
					}

				} else if connection.Target.Port == 0 {

					if isForbiddenHost("OUTPUT", connection.Target.Host) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Target.Host + ":*\"")
						result_target = permitHost("OUTPUT", connection.Target.Host)
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

					if isForbiddenPort("INPUT", connection.Source.Port) {
						console.Info("adapters/iptables: Permit Connection \"*:" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = permitPort("INPUT", connection.Source.Port)
					} else {
						result_source = true
					}

				}

			} else {

				if connection.Source.Port != 0 {

					if isForbiddenHostAndPort("INPUT", connection.Source.Host, connection.Source.Port) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Source.Host + ":" + strconv.FormatUint(uint64(connection.Source.Port), 10) + "\"")
						result_source = permitHostAndPort("INPUT", connection.Source.Host, connection.Source.Port)
					} else {
						result_source = true
					}

				} else if connection.Source.Port == 0 {

					if isForbiddenHost("INPUT", connection.Source.Host) {
						console.Info("adapters/iptables: Permit Connection \"" + connection.Source.Host + ":*\"")
						result_source = permitHost("INPUT", connection.Source.Host)
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
