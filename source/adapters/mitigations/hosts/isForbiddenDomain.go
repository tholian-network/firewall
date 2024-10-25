package hosts

func isForbiddenDomain(domain string) bool {

	var result bool = false

	ips, ok := Hosts[domain]

	if ok == true {

		for i := 0; i < len(ips); i++ {

			if ips[i] == "0.0.0.0" {
				result = true
				break
			}

		}

	}

	return result

}
