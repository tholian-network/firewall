package iptables

import "os/exec"

var SUPPORTED bool = false
var SUPPORTED_IPV4 bool = false
var SUPPORTED_IPV6 bool = false

var programIPv4 string
var programIPv6 string

func findProgram(names ...string) string {

	for n := 0; n < len(names); n++ {

		path, err := exec.LookPath(names[n])

		if err == nil {
			return path
		}

	}

	return ""

}

func init() {

	programIPv4 = findProgram("iptables", "iptables-nft", "/usr/sbin/iptables", "/sbin/iptables")
	programIPv6 = findProgram("ip6tables", "ip6tables-nft", "/usr/sbin/ip6tables", "/sbin/ip6tables")

	SUPPORTED_IPV4 = programIPv4 != ""
	SUPPORTED_IPV6 = programIPv6 != ""
	SUPPORTED = SUPPORTED_IPV4

}
