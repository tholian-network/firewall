package actions

import "tholian-firewall/structs"

func Forbid(console *structs.Console, target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return ForbidNetwork(console, parsed.Network)
	} else if parsed.Kind == "connection" {
		return ForbidConnection(console, parsed.Connection)
	} else if parsed.Kind == "domain" {
		return forbidDomain(console, parsed.Domain)
	}

	return false

}
