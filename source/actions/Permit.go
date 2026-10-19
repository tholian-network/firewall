package actions

import "tholian-core/structs"

func Permit(console *structs.Console, target string) bool {

	parsed := ParseTarget(target)

	if parsed.IsNetwork() {
		return PermitNetwork(console, parsed.Network)
	} else if parsed.IsConnection() {
		return PermitConnection(console, parsed.Connection)
	} else if parsed.IsDomain() {
		return permitDomain(console, parsed.Domain)
	}

	return false

}
