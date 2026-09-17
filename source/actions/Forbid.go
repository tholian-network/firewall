package actions

import "tholian-firewall/adapters/mitigations/ebpf"

func Forbid(target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return ForbidNetwork(parsed.Network)
	} else if parsed.Kind == "connection" {
		return ForbidConnection(parsed.Connection)
	} else if parsed.Kind == "domain" {
		return ebpf.ForbidAddress(parsed.Domain)
	}

	return false

}
