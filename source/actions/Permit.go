package actions

import "tholian-firewall/adapters/mitigations/ebpf"

func Permit(target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return PermitNetwork(parsed.Network)
	} else if parsed.Kind == "connection" {
		return PermitConnection(parsed.Connection)
	} else if parsed.Kind == "domain" {
		return ebpf.PermitAddress(parsed.Domain)
	}

	return false

}
