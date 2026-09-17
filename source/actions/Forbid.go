package actions

func Forbid(target string) bool {

	parsed := ParseTarget(target)

	if parsed.Kind == "network" {
		return ForbidNetwork(parsed.Network)
	} else if parsed.Kind == "connection" {
		return ForbidConnection(parsed.Connection)
	} else if parsed.Kind == "domain" {
		return forbidDomain(parsed.Domain)
	}

	return false

}
