package actions

import "tholian-firewall/structs"
import "fmt"
import "strings"

func load_rules(console *structs.Console, content string, forbid func(*structs.Console, string) bool, permit func(*structs.Console, string) bool) bool {

	var result bool = true

	lines := strings.Split(content, "\n")

	for l := 0; l < len(lines); l++ {

		line := strings.TrimSpace(lines[l])

		if index := strings.Index(line, "#"); index >= 0 {
			line = line[0:index]
		}

		if line == "" {
			continue
		}

		statements := strings.Split(line, ";")

		for s := 0; s < len(statements); s++ {

			statement := strings.TrimSpace(statements[s])

			if statement == "" {
				continue
			}

			fields := strings.Fields(statement)

			if len(fields) != 2 || (fields[0] != "forbid" && fields[0] != "permit") {

				console.Error(fmt.Sprintf("actions/Load: invalid rule on line %d: %q", l+1, statement))
				result = false
				continue

			}

			if fields[0] == "forbid" {

				if forbid(console, fields[1]) == false {
					result = false
				}

			} else if fields[0] == "permit" {

				if permit(console, fields[1]) == false {
					result = false
				}

			}

		}

	}

	return result

}

