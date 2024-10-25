package iptables

import "os"

var SUPPORTED bool = false

func init() {

	_, err1 := os.Stat("/sbin/iptables")
	_, err2 := os.Stat("/sbin/ip6tables")

	if err1 == nil && err2 == nil {
		SUPPORTED = true
	}

}
