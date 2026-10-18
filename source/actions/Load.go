package actions

import "tholian-firewall/structs"
import "os"

func Load(console *structs.Console, path string) bool {

	buffer, err1 := os.ReadFile(path)

	if err1 != nil {
		console.Error("actions/Load: " + err1.Error())
		return false
	}

	return load_rules(console, string(buffer), Forbid, Permit)

}
