package actions

import "tholian-firewall/internal/rules"
import "tholian-core/structs"
import "os"

func Load(console *structs.Console, path string) bool {

	buffer, err1 := os.ReadFile(path)

	if err1 != nil {
		console.Error("actions/Load: " + err1.Error())
		return false
	}

	return rules.Load(console, string(buffer), Forbid, Permit)

}
