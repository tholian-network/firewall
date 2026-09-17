package iptables

import "strconv"

func isForbiddenHostAndPort(chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return ruleExists(program, "-C", "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			ruleExists(program, "-C", "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return ruleExists(program, "-C", "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			ruleExists(program, "-C", "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}

func forbidHostAndPort(chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return addRuleOnce(program, "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			addRuleOnce(program, "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return addRuleOnce(program, "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			addRuleOnce(program, "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}

func permitHostAndPort(chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return deleteRuleOnce(program, "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			deleteRuleOnce(program, "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return deleteRuleOnce(program, "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			deleteRuleOnce(program, "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}
