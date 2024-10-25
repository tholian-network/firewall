package hosts

import "tholian-endpoint/console"

func PermitDomain(domain string) bool {

	var result bool = false

	if SUPPORTED == true {

		if isForbiddenDomain(domain) {

			console.Warn("adapters/hosts: Permit Domain \"" + domain + "\"")

			ips, ok := Hosts[domain]

			if ok == true {

				var filtered []string

				for i := 0; i < len(ips); i++ {

					if ips[i] == "0.0.0.0" {
						continue
					} else if ips[i] == "0000:0000:0000:0000:0000:0000:0000:0000" {
						continue
					} else {
						filtered = append(filtered, ips[i])
					}

				}

				if len(filtered) > 0 {
					Hosts[domain] = filtered
				} else {
					delete(Hosts, domain)
				}

			}

			result = saveHosts()

		} else {

			result = true

		}

	}

	return result

}
