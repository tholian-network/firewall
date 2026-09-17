package hosts

import "tholian-firewall/console"

func PermitDomain(domain string) bool {

	if SUPPORTED == false {
		return false
	}

	domain = normalizeDomain(domain)

	if domain == "" {
		return false
	}

	hostsMutex.Lock()
	defer hostsMutex.Unlock()

	if isForbiddenDomain(domain) == false {
		return true
	}

	console.Warn("adapters/hosts: Permit Domain \"" + domain + "\"")

	filtered := make([]string, 0)

	for i := 0; i < len(Hosts[domain]); i++ {

		if Hosts[domain][i] == sinkIPv4 || Hosts[domain][i] == sinkIPv6 {
			continue
		}

		filtered = append(filtered, Hosts[domain][i])

	}

	if len(filtered) > 0 {
		Hosts[domain] = filtered
	} else {
		delete(Hosts, domain)
	}

	return saveHosts()

}
