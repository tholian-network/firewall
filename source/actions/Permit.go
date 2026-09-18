package actions

import "tholian-firewall/structs"

func Permit(console *structs.Console, target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return PermitNetwork(console, parsed.Network)
	} else if parsed.Kind == "connection" {
		return PermitConnection(console, parsed.Connection)
	} else if parsed.Kind == "domain" {
		return permitDomain(console, parsed.Domain)
	}

	return false

}
