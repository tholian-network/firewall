package iptables

import "strconv"
import "tholian-firewall/structs"

func isForbiddenHostAndPort(console *structs.Console, chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return ruleExists(console, program, "-C", "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			ruleExists(console, program, "-C", "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return ruleExists(console, program, "-C", "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			ruleExists(console, program, "-C", "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}

func forbidHostAndPort(console *structs.Console, chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return addRuleOnce(console, program, "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			addRuleOnce(console, program, "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return addRuleOnce(console, program, "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			addRuleOnce(console, program, "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}

func permitHostAndPort(console *structs.Console, chain string, address string, port uint16) bool {

	program, addr := resolveProgram(address)

	if program == "" || port == 0 {
		return false
	}

	if chain == "INPUT" {

		sport := strconv.FormatUint(uint64(port), 10)

		return deleteRuleOnce(console, program, "INPUT", "-p", "udp", "-s", addr, "--sport", sport, "-j", "DROP") &&
			deleteRuleOnce(console, program, "INPUT", "-p", "tcp", "-s", addr, "--sport", sport, "-j", "DROP")

	} else if chain == "OUTPUT" {

		dport := strconv.FormatUint(uint64(port), 10)

		return deleteRuleOnce(console, program, "OUTPUT", "-p", "udp", "-d", addr, "--dport", dport, "-j", "DROP") &&
			deleteRuleOnce(console, program, "OUTPUT", "-p", "tcp", "-d", addr, "--dport", dport, "-j", "DROP")

	}

	return false

}
