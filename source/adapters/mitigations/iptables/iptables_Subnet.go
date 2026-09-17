package iptables

import "strconv"

func subnetSpec(address string, prefix uint8) (string, string) {

	program, addr := resolveProgram(address)

	if program == "" || prefix == 0 {
		return "", ""
	}

	mask := strconv.FormatUint(uint64(prefix), 10)

	return program, addr + "/" + mask

}

func isForbiddenSubnet(chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return ruleExists(program, "-C", "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return ruleExists(program, "-C", "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func forbidSubnet(chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return addRuleOnce(program, "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return addRuleOnce(program, "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func permitSubnet(chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return deleteRuleOnce(program, "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return deleteRuleOnce(program, "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func ForbidSubnet(address string, prefix uint8) bool {
	return forbidSubnet("INPUT", address, prefix) && forbidSubnet("OUTPUT", address, prefix)
}

func PermitSubnet(address string, prefix uint8) bool {
	return permitSubnet("INPUT", address, prefix) && permitSubnet("OUTPUT", address, prefix)
}

func IsForbiddenSubnet(address string, prefix uint8) bool {
	return isForbiddenSubnet("INPUT", address, prefix) || isForbiddenSubnet("OUTPUT", address, prefix)
}
