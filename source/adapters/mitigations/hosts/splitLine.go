package hosts

import "strings"

func splitLine(line string, separator string) []string {

	if separator == "" {
		separator = " "
	}

	if separator == " " {
		line = strings.ReplaceAll(line, "\t", " ")
	}

	filtered := make([]string, 0)
	tmp := strings.Split(strings.TrimSpace(line), separator)

	for t := 0; t < len(tmp); t++ {

		chunk := strings.TrimSpace(tmp[t])

		if chunk != "" {
			filtered = append(filtered, chunk)
		}

	}

	return filtered

}
