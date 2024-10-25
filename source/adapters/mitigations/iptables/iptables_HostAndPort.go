package iptables

import "tholian-endpoint/types"
import "os/exec"
import "strconv"

func isForbiddenHostAndPort(chain string, address string, port uint16) bool {

	var program string

	if types.IsIPv6(address) {

		ipv6 := types.ParseIPv6(address)

		if ipv6 != nil {
			tmp := ipv6.String()
			address = tmp[1 : len(tmp)-1]
			program = "ip6tables"
		}

	} else if types.IsIPv4(address) {

		ipv4 := types.ParseIPv4(address)

		if ipv4 != nil {
			address = ipv4.String()
			program = "iptables"
		}

	}

	var result bool = false

	if program != "" && port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-C", "INPUT", "-p", "udp", "-s", address, "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command(program, "-C", "INPUT", "-p", "tcp", "-s", address, "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-C", "OUTPUT", "-p", "udp", "-d", address, "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command(program, "-C", "OUTPUT", "-p", "tcp", "-d", address, "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}

func forbidHostAndPort(chain string, address string, port uint16) bool {

	var program string

	if types.IsIPv6(address) {

		ipv6 := types.ParseIPv6(address)

		if ipv6 != nil {
			tmp := ipv6.String()
			address = tmp[1 : len(tmp)-1]
			program = "ip6tables"
		}

	} else if types.IsIPv4(address) {

		ipv4 := types.ParseIPv4(address)

		if ipv4 != nil {
			address = ipv4.String()
			program = "iptables"
		}

	}

	var result bool = false

	if program != "" && port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-A", "INPUT", "-p", "udp", "-s", address, "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command(program, "-A", "INPUT", "-p", "tcp", "-s", address, "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-A", "OUTPUT", "-p", "udp", "-d", address, "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command(program, "-A", "OUTPUT", "-p", "tcp", "-d", address, "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}

func permitHostAndPort(chain string, address string, port uint16) bool {

	var program string

	if types.IsIPv6(address) {

		ipv6 := types.ParseIPv6(address)

		if ipv6 != nil {
			tmp := ipv6.String()
			address = tmp[1 : len(tmp)-1]
			program = "ip6tables"
		}

	} else if types.IsIPv4(address) {

		ipv4 := types.ParseIPv4(address)

		if ipv4 != nil {
			address = ipv4.String()
			program = "iptables"
		}

	}

	var result bool = false

	if program != "" && port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-D", "INPUT", "-p", "udp", "-s", address, "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command(program, "-D", "INPUT", "-p", "tcp", "-s", address, "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command(program, "-D", "OUTPUT", "-p", "udp", "-d", address, "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command(program, "-D", "OUTPUT", "-p", "tcp", "-d", address, "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}
