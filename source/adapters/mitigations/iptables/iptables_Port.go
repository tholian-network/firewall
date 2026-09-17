package iptables

import "strconv"

func isForbiddenPort(chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return ruleExists(program, "-C", "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				ruleExists(program, "-C", "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return ruleExists(program, "-C", "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				ruleExists(program, "-C", "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func forbidPort(chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return addRuleOnce(program, "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				addRuleOnce(program, "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return addRuleOnce(program, "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				addRuleOnce(program, "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func permitPort(chain string, port uint16) bool {

	if port == 0 {
		return false
	}

	value := strconv.FormatUint(uint64(port), 10)

	if chain == "INPUT" {

		return runForFamilies(func(program string) bool {
			return deleteRuleOnce(program, "INPUT", "-p", "udp", "--sport", value, "-j", "DROP") &&
				deleteRuleOnce(program, "INPUT", "-p", "tcp", "--sport", value, "-j", "DROP")
		})

	} else if chain == "OUTPUT" {

		return runForFamilies(func(program string) bool {
			return deleteRuleOnce(program, "OUTPUT", "-p", "udp", "--dport", value, "-j", "DROP") &&
				deleteRuleOnce(program, "OUTPUT", "-p", "tcp", "--dport", value, "-j", "DROP")
		})

	}

	return false

}

func ForbidPort(port uint16) bool {
	return forbidPort("INPUT", port) && forbidPort("OUTPUT", port)
}

func PermitPort(port uint16) bool {
	return permitPort("INPUT", port) && permitPort("OUTPUT", port)
}

func IsForbiddenPort(port uint16) bool {
	return isForbiddenPort("INPUT", port) || isForbiddenPort("OUTPUT", port)
}
