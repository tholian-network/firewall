package actions

import "tholian-firewall/console"
import "os"
import "strings"

func Load(path string) bool {

	var result bool = true

	buffer, err1 := os.ReadFile(path)

	if err1 != nil {
		console.Error("actions/Load: " + err1.Error())
		return false
	}

	lines := strings.Split(strings.TrimSpace(string(buffer)), "\n")

	for l := 0; l < len(lines); l++ {

		line := strings.TrimSpace(lines[l])

		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}

		fields := strings.Fields(line)

		if len(fields) == 2 {

			if fields[0] == "forbid" {
				if Forbid(fields[1]) == false {
					result = false
				}
			} else if fields[0] == "permit" {
				if Permit(fields[1]) == false {
					result = false
				}
			} else {
				result = false
			}

		} else {
			result = false
		}

	}

	return result

}
