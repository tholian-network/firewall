package iptables

import "strconv"
import "tholian-firewall/structs"

func isForbiddenPort(console *structs.Console, chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return ruleExists(console, program, "-C", "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				ruleExists(console, program, "-C", "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return ruleExists(console, program, "-C", "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				ruleExists(console, program, "-C", "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func forbidPort(console *structs.Console, chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return addRuleOnce(console, program, "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				addRuleOnce(console, program, "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return addRuleOnce(console, program, "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				addRuleOnce(console, program, "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func permitPort(console *structs.Console, chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return deleteRuleOnce(console, program, "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				deleteRuleOnce(console, program, "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return deleteRuleOnce(console, program, "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				deleteRuleOnce(console, program, "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func ForbidPort(console *structs.Console, port uint16) bool {
	return forbidPort(console, "INPUT", port) && forbidPort(console, "OUTPUT", port)
}

func PermitPort(console *structs.Console, port uint16) bool {
	return permitPort(console, "INPUT", port) && permitPort(console, "OUTPUT", port)
}

func IsForbiddenPort(console *structs.Console, port uint16) bool {
	return isForbiddenPort(console, "INPUT", port) || isForbiddenPort(console, "OUTPUT", port)
}
