package hosts

import "tholian-core/structs"
import "os"
import "sort"

func save_hosts(console *structs.Console) bool {

	var content string

	buffer, err := os.ReadFile(hostsPath)

	if err == nil {
		content = string(buffer)
	}

	domains := make([]string, 0, len(Hosts))

	for domain, ips := range Hosts {

		if len(ips) > 0 {
			domains = append(domains, domain)
		}

	}

	sort.Strings(domains)

	return write_hosts(console, []byte(render_hosts(content, domains)))

}
