package hosts

import "sort"

func Status() []string {

	hostsMutex.Lock()
	defer hostsMutex.Unlock()

	domains := make([]string, 0, len(Hosts))

	for domain := range Hosts {

		if isForbiddenDomain(domain) == true {
			domains = append(domains, domain)
		}

	}

	sort.Strings(domains)

	result := make([]string, 0)

	for d := 0; d < len(domains); d++ {
		result = append(result, "domain "+domains[d])
	}

	return result

}
