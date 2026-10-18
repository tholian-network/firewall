package utils

import "strings"

func parse_kernel_config(config string) bool {

	options := make(map[string]bool)

	for key := range bpf_required_options {
		options[key] = false
	}

	lines := strings.Split(strings.TrimSpace(config), "\n")

	for l := 0; l < len(lines); l++ {

		line := lines[l]

		if strings.HasPrefix(line, "#") || strings.Contains(line, "=") == false {
			continue
		}

		tmp := strings.SplitN(line, "=", 2)
		key := strings.TrimSpace(tmp[0])
		value := strings.TrimSpace(tmp[1])

		if _, exists := options[key]; exists == false {
			continue
		}

		values := make([]string, 0)

		if strings.HasPrefix(value, "\"") && strings.HasSuffix(value, "\"") {
			values = strings.Split(value[1:len(value)-1], ",")
		} else {
			values = append(values, value)
		}

		for v := 0; v < len(values); v++ {

			if values[v] == bpf_required_options[key] {
				options[key] = true
				break
			}

		}

	}

	for key := range options {

		if options[key] == false {
			return false
		}

	}

	return true

}

