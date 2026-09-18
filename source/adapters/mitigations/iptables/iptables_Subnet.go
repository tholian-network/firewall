package iptables

import "strconv"
import "tholian-firewall/structs"

func subnetSpec(address string, prefix uint8) (string, string) {

	program, addr := resolveProgram(address)

	if program == "" || prefix == 0 {
		return "", ""
	}

	mask := strconv.FormatUint(uint64(prefix), 10)

	return program, addr + "/" + mask

}

func isForbiddenSubnet(console *structs.Console, chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return ruleExists(console, program, "-C", "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return ruleExists(console, program, "-C", "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func forbidSubnet(console *structs.Console, chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return addRuleOnce(console, program, "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return addRuleOnce(console, program, "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func permitSubnet(console *structs.Console, chain string, address string, prefix uint8) bool {

	program, spec := subnetSpec(address, prefix)

	if program == "" {
		return false
	}

	if chain == "INPUT" {
		return deleteRuleOnce(console, program, "INPUT", "-s", spec, "-j", "DROP")
	} else if chain == "OUTPUT" {
		return deleteRuleOnce(console, program, "OUTPUT", "-d", spec, "-j", "DROP")
	}

	return false

}

func ForbidSubnet(console *structs.Console, address string, prefix uint8) bool {
	return forbidSubnet(console, "INPUT", address, prefix) && forbidSubnet(console, "OUTPUT", address, prefix)
}

func PermitSubnet(console *structs.Console, address string, prefix uint8) bool {
	return permitSubnet(console, "INPUT", address, prefix) && permitSubnet(console, "OUTPUT", address, prefix)
}

func IsForbiddenSubnet(console *structs.Console, address string, prefix uint8) bool {
	return isForbiddenSubnet(console, "INPUT", address, prefix) || isForbiddenSubnet(console, "OUTPUT", address, prefix)
}
