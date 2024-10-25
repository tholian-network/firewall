package iptables

import "tholian-endpoint/types"
import "os/exec"
import "strconv"

func isForbiddenSubnet(chain string, address string, prefix uint8) bool {

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

	if program != "" && prefix != 0 {

		mask := strconv.FormatUint(uint64(prefix), 10)

		if chain == "INPUT" {

			cmd := exec.Command(program, "-C", "INPUT", "-s", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			cmd := exec.Command(program, "-C", "OUTPUT", "-d", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		}

	}

	return result

}

func forbidSubnet(chain string, address string, prefix uint8) bool {

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

	if program != "" && prefix != 0 {

		mask := strconv.FormatUint(uint64(prefix), 10)

		if chain == "INPUT" {

			cmd := exec.Command(program, "-A", "INPUT", "-s", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			cmd := exec.Command(program, "-A", "OUTPUT", "-d", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		}

	}

	return result

}

func permitSubnet(chain string, address string, prefix uint8) bool {

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

	if program != "" && prefix != 0 {

		mask := strconv.FormatUint(uint64(prefix), 10)

		if chain == "INPUT" {

			cmd := exec.Command(program, "-D", "INPUT", "-s", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		} else if chain == "OUTPUT" {

			cmd := exec.Command(program, "-D", "OUTPUT", "-d", address+"/"+mask, "-j", "DROP")
			_, err := cmd.Output()

			if err == nil {
				result = true
			}

		}

	}

	return result

}
