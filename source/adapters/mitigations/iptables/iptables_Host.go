package iptables

import "tholian-firewall/types"
import "tholian-firewall/structs"

func isForbiddenHost(console *structs.Console, chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return ruleExists(console, program, "-C", "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return ruleExists(console, program, "-C", "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func forbidHost(console *structs.Console, chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return addRuleOnce(console, program, "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return addRuleOnce(console, program, "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func permitHost(console *structs.Console, chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return deleteRuleOnce(console, program, "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return deleteRuleOnce(console, program, "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func ForbidAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return forbidHost(console, "INPUT", address) && forbidHost(console, "OUTPUT", address)

}

func PermitAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return permitHost(console, "INPUT", address) && permitHost(console, "OUTPUT", address)

}

func IsForbiddenAddress(console *structs.Console, address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return isForbiddenHost(console, "INPUT", address) || isForbiddenHost(console, "OUTPUT", address)

}
