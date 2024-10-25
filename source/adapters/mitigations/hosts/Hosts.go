package hosts

import "tholian-endpoint/types"
import "os"
import "strings"

var Hosts map[string][]string
var SUPPORTED bool = false

func addHost(domain string, ip_raw string) {

	var ip string

	if types.IsIPv4(ip_raw) {

		ipv4 := types.ParseIPv4(ip_raw)

		if ipv4 != nil {
			ip = ipv4.String()
		}

	} else if types.IsIPv6(ip_raw) {

		ipv6 := types.ParseIPv6(ip_raw)

		if ipv6 != nil {
			tmp := ipv6.String()
			ip = tmp[1: len(tmp)-1]
		}

	}

	if ip != "" {

		_, ok := Hosts[domain]

		if ok == true {

			var found bool = false

			for h := 0; h < len(Hosts[domain]); h++ {

				if Hosts[domain][h] == ip {
					found = true
					break
				}

			}

			if found == false {
				Hosts[domain] = append(Hosts[domain], ip)
			}

		} else {
			Hosts[domain] = []string{ip}
		}

	}

}

func init() {

	Hosts = make(map[string][]string)

	_, err1 := os.Stat("/etc/hosts")

	if err1 == nil {

		SUPPORTED = true

		buffer, err2 := os.ReadFile("/etc/hosts")

		if err2 == nil {

			var lines = strings.Split(strings.TrimSpace(string(buffer)), "\n")

			for l := 0; l < len(lines); l++ {

				var line = strings.TrimSpace(lines[l])

				if strings.Contains(line, "#") {
					line = strings.TrimSpace(line[0:strings.Index(line, "#")])
				}

				if len(line) > 0 {

					entry := splitLine(line, " ")

					if len(entry) > 2 {

						for e := 1; e < len(entry); e++ {

							var ip = entry[0]
							var host = entry[e]

							if types.IsDomain(host) || strings.Contains(host, ".") == false {
								addHost(host, ip)
							}

						}

					} else if len(entry) == 2 {

						var ip = entry[0]
						var host = entry[1]

						if types.IsDomain(host) || strings.Contains(host, ".") == false {
							addHost(host, ip)
						}

					}

				}

			}

		}

	}

}
