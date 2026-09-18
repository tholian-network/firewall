package hosts

import "tholian-firewall/structs"
import "path/filepath"
import "strings"
import "sort"
import "os"

func renderHosts(content string, domains []string) string {

	block := make([]string, 0)

	block = append(block, beginMarker)

	for d := 0; d < len(domains); d++ {
		block = append(block, sinkIPv4+" "+domains[d])
		block = append(block, sinkIPv6+" "+domains[d])
	}

	block = append(block, endMarker)

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

	if begin != -1 && end != -1 && end > begin {

		result := make([]string, 0)
		result = append(result, lines[:begin]...)
		result = append(result, block...)
		result = append(result, lines[end+1:]...)

		return strings.Join(result, "\n")

	}

	result := strings.TrimRight(content, "\n")

	if result != "" {
		result = result + "\n\n"
	}

	result = result + strings.Join(block, "\n") + "\n"

	return result

}

func writeHosts(console *structs.Console, buffer []byte) bool {

	mode := os.FileMode(0644)

	info, err := os.Stat(hostsPath)

	if err == nil {
		mode = info.Mode().Perm()
	}

	target := hostsPath

	resolved, err := filepath.EvalSymlinks(hostsPath)

	if err == nil {
		target = resolved
	}

	directory := filepath.Dir(target)

	temp, err := os.CreateTemp(directory, ".tholian-hosts-*")

	if err != nil {
		console.Error("adapters/hosts: " + err.Error())
		return false
	}

	tempName := temp.Name()

	cleanup := func() {
		temp.Close()
		os.Remove(tempName)
	}

	if _, err := temp.Write(buffer); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		cleanup()
		return false
	}

	if err := temp.Sync(); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		cleanup()
		return false
	}

	if err := temp.Close(); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	if err := os.Chmod(tempName, mode); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	if err := os.Rename(tempName, target); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	return true

}

func saveHosts(console *structs.Console) bool {

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

	return writeHosts(console, []byte(renderHosts(content, domains)))

}
