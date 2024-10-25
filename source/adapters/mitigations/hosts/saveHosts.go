package hosts

import "tholian-endpoint/types"
import "os"
import "sort"
import "strings"

func saveHosts() bool {

	var result bool = false
	var lines []string
	var hosts_local_v4 [][]string
	var hosts_local_v6 [][]string
	var hosts_inter_v4 [][]string
	var hosts_inter_v6 [][]string
	var hosts_blocked [][]string

	for domain, ips := range Hosts {

		for i := 0; i < len(ips); i++ {

			if ips[i] == "0.0.0.0" {

				hosts_blocked = append(hosts_blocked, []string{ips[i], domain})

			} else if strings.Contains(domain, ".") {

				if types.IsIPv4(ips[i]) {
					hosts_inter_v4 = append(hosts_inter_v4, []string{ips[i], domain})
				} else if types.IsIPv6(ips[i]) {
					hosts_inter_v6 = append(hosts_inter_v6, []string{ips[i], domain})
				}

			} else {

				if types.IsIPv4(ips[i]) {
					hosts_local_v4 = append(hosts_local_v4, []string{ips[i], domain})
				} else if types.IsIPv6(ips[i]) {
					hosts_local_v6 = append(hosts_local_v6, []string{ips[i], domain})
				}

			}

		}

	}

	sort.Slice(hosts_local_v4, func(a int, b int) bool {
		return hosts_local_v4[a][0] < hosts_local_v4[b][0]
	})

	sort.Slice(hosts_local_v6, func(a int, b int) bool {
		return hosts_local_v6[a][0] < hosts_local_v6[b][0]
	})

	sort.Slice(hosts_inter_v4, func(a int, b int) bool {
		return hosts_inter_v4[a][0] < hosts_inter_v4[b][0]
	})

	sort.Slice(hosts_inter_v6, func(a int, b int) bool {
		return hosts_inter_v6[a][0] < hosts_inter_v6[b][0]
	})

	sort.Slice(hosts_blocked, func(a int, b int) bool {
		return hosts_blocked[a][1] < hosts_blocked[b][1]
	})

	lines = append(lines, "")
	lines = append(lines, "# LOCAL HOSTS")
	lines = append(lines, "")

	for h := 0; h < len(hosts_local_v4); h++ {
		lines = append(lines, hosts_local_v4[h][0]+" "+hosts_local_v4[h][1])
	}

	for h := 0; h < len(hosts_local_v6); h++ {
		lines = append(lines, hosts_local_v6[h][0]+" "+hosts_local_v6[h][1])
	}

	lines = append(lines, "")
	lines = append(lines, "# INTERNET HOSTS")
	lines = append(lines, "")

	for h := 0; h < len(hosts_inter_v4); h++ {
		lines = append(lines, hosts_inter_v4[h][0]+" "+hosts_inter_v4[h][1])
	}

	for h := 0; h < len(hosts_inter_v6); h++ {
		lines = append(lines, hosts_inter_v6[h][0]+" "+hosts_inter_v6[h][1])
	}

	lines = append(lines, "")
	lines = append(lines, "# BLOCKED HOSTS")
	lines = append(lines, "")

	for h := 0; h < len(hosts_blocked); h++ {
		lines = append(lines, hosts_blocked[h][0]+" "+hosts_blocked[h][1])
	}

	var buffer = []byte(strings.Join(lines, "\n"))

	if len(buffer) > 0 {

		err := os.WriteFile("/etc/hosts", buffer, 0666)

		if err == nil {
			result = true
		}

	}

	return result

}
