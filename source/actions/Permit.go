package actions

func Permit(target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return PermitNetwork(parsed.Network)
	} else if parsed.Kind == "connection" {
		return PermitConnection(parsed.Connection)
	} else if parsed.Kind == "domain" {
		return permitDomain(parsed.Domain)
	}

	return false

}
