package hosts

func isForbiddenDomain(domain string) bool {

	var result bool = false

	ips, ok := Hosts[domain]

	if ok == true {

		for i := 0; i < len(ips); i++ {

			if ips[i] == sinkIPv4 || ips[i] == sinkIPv6 {
				result = true
				break
			}

		}

	}

	return result

}

func IsForbiddenDomain(domain string) bool {

	domain = normalizeDomain(domain)

	if domain == "" {
		return false
	}

	hostsMutex.Lock()
	defer hostsMutex.Unlock()

	return isForbiddenDomain(domain)

}
