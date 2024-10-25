package hosts

import "tholian-endpoint/console"

func ForbidDomain(domain string) bool {

	var result bool = false

	if SUPPORTED == true {

		if isForbiddenDomain(domain) {

			result = true

		} else {

			console.Warn("adapters/hosts: Forbid Domain \"" + domain + "\"")
			Hosts[domain] = []string{"0.0.0.0"}
			result = saveHosts()

		}

	}

	return result

}
