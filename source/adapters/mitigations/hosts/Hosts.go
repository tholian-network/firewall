package hosts

import "tholian-firewall/types"
import "os"
import "strings"
import "sync"

const beginMarker = "# BEGIN THOLIAN FIREWALL - do not edit below"
const endMarker = "# END THOLIAN FIREWALL"

const sinkIPv4 = "0.0.0.0"
const sinkIPv6 = "0000:0000:0000:0000:0000:0000:0000:0000"

var hostsPath = "/etc/hosts"

var Hosts map[string][]string
var SUPPORTED bool = false

var hostsMutex sync.Mutex

func normalizeDomain(value string) string {

	domain := strings.ToLower(strings.TrimSpace(value))
	domain = strings.TrimSuffix(domain, ".")

	return domain

}

func addHost(domain string, ip_raw string) {

	domain = normalizeDomain(domain)

	if domain == "" {
		return
	}

	var ip string

	if types.IsIPv4(ip_raw) {

		ipv4 := types.ParseIPv4(ip_raw)

		if ipv4 != nil {
			ip = ipv4.String()
		}

	} else if types.IsIPv6(ip_raw) {

		ipv6 := types.ParseIPv6(ip_raw)

		if ipv6 != nil {
			ip = ipv6.String()
		}

	}

	if ip != "" {

		ips, ok := Hosts[domain]

		if ok == true {

			var found bool = false

			for h := 0; h < len(ips); h++ {

				if ips[h] == ip {
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

func extractManagedBlock(content string) string {

	lines := strings.Split(content, "\n")

	begin := -1
	end := -1

	for l := 0; l < len(lines); l++ {

		trimmed := strings.TrimSpace(lines[l])

		if trimmed == beginMarker {
			begin = l
		}

		if begin != -1 && trimmed == endMarker {
			end = l
			break
		}

	}

	if begin == -1 || end == -1 || end <= begin {
		return ""
	}

	return strings.Join(lines[begin+1:end], "\n")

}

func parseManagedBlock(content string) {

	lines := strings.Split(extractManagedBlock(content), "\n")

	for l := 0; l < len(lines); l++ {

		line := strings.TrimSpace(lines[l])

		if strings.Contains(line, "#") {
			line = strings.TrimSpace(line[0:strings.Index(line, "#")])
		}

		if len(line) > 0 {

			entry := splitLine(line, " ")

			if len(entry) >= 2 {

				ip := entry[0]

				for e := 1; e < len(entry); e++ {
					addHost(entry[e], ip)
				}

			}

		}

	}

}

func fileIsWritable(path string) bool {

	file, err := os.OpenFile(path, os.O_RDWR, 0)

	if err != nil {
		return false
	}

	file.Close()

	return true

}

func init() {

	Hosts = make(map[string][]string)

	if fileIsWritable(hostsPath) == true {

		SUPPORTED = true

		buffer, err := os.ReadFile(hostsPath)

		if err == nil {
			parseManagedBlock(string(buffer))
		}

	}

}
