package actions

import "tholian-firewall/structs"

func Forbid(console *structs.Console, target string) bool {

	parsed := ParseTarget(target)

	if parsed.IsNetwork() {
		return ForbidNetwork(console, parsed.Network)
	} else if parsed.IsConnection() {
		return ForbidConnection(console, parsed.Connection)
	} else if parsed.IsDomain() {
		return forbidDomain(console, parsed.Domain)
	}

	return false

}
