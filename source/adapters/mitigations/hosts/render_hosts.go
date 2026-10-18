package hosts

import "strings"

func render_hosts(content string, domains []string) string {

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

	if begin != -1 {

		end_line := len(lines) - 1

		if end != -1 && end > begin {
			end_line = end
		}

		result := make([]string, 0)
		result = append(result, lines[:begin]...)
		result = append(result, block...)
		result = append(result, lines[end_line+1:]...)

		return strings.Join(result, "\n")

	}

	result := strings.TrimRight(content, "\n")

	if result != "" {
		result = result + "\n\n"
	}

	result = result + strings.Join(block, "\n") + "\n"

	return result

}

