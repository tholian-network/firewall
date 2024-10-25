package iptables

import "os/exec"
import "strconv"

func isForbiddenPort(chain string, port uint16) bool {

	var result bool = false

	if port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-C", "INPUT", "-p", "udp", "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-C", "INPUT", "-p", "tcp", "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-C", "OUTPUT", "-p", "udp", "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-C", "OUTPUT", "-p", "tcp", "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}

func forbidPort(chain string, port uint16) bool {

	var result bool = false

	if port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-A", "INPUT", "-p", "udp", "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-A", "INPUT", "-p", "tcp", "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-A", "OUTPUT", "-p", "udp", "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-A", "OUTPUT", "-p", "tcp", "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}

func permitPort(chain string, port uint16) bool {

	var result bool = false

	if port != 0 {

		if chain == "INPUT" {

			sport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-D", "INPUT", "-p", "udp", "--sport", sport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-D", "INPUT", "-p", "tcp", "--sport", sport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			dport := strconv.FormatUint(uint64(port), 10)

			cmd1 := exec.Command("iptables", "-D", "OUTPUT", "-p", "udp", "--dport", dport, "-j", "DROP")
			cmd2 := exec.Command("iptables", "-D", "OUTPUT", "-p", "tcp", "--dport", dport, "-j", "DROP")

			_, err1 := cmd1.Output()
			_, err2 := cmd2.Output()

			if err1 == nil && err2 == nil {
				result = true
			}

		}

	}

	return result

}
