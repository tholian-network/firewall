package iptables

import "tholian-firewall/types"

func isForbiddenHost(chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return ruleExists(program, "-C", "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return ruleExists(program, "-C", "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func forbidHost(chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return addRuleOnce(program, "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return addRuleOnce(program, "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func permitHost(chain string, address string) bool {

	program, addr := resolveProgram(address)

	if program != "" {

		if chain == "INPUT" {
			return deleteRuleOnce(program, "INPUT", "-s", addr, "-j", "DROP")
		} else if chain == "OUTPUT" {
			return deleteRuleOnce(program, "OUTPUT", "-d", addr, "-j", "DROP")
		}

	}

	return false

}

func ForbidAddress(address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return forbidHost("INPUT", address) && forbidHost("OUTPUT", address)

}

func PermitAddress(address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return permitHost("INPUT", address) && permitHost("OUTPUT", address)

}

func IsForbiddenAddress(address string) bool {

	if types.IsDomain(address) {
		return false
	}

	return isForbiddenHost("INPUT", address) || isForbiddenHost("OUTPUT", address)

}
