package hosts

import "tholian-firewall/console"

func ForbidDomain(domain string) bool {

	if SUPPORTED == false {
		return false
	}

	domain = normalizeDomain(domain)

	if domain == "" {
		return false
	}

	hostsMutex.Lock()
	defer hostsMutex.Unlock()

	if isForbiddenDomain(domain) == true {
		return true
	}

	console.Warn("adapters/hosts: Forbid Domain \"" + domain + "\"")

	Hosts[domain] = []string{sinkIPv4, sinkIPv6}

	return saveHosts()

}
