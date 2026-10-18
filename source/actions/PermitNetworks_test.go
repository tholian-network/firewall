package actions

import "testing"
import "tholian-firewall/structs"

func TestPermitNetworksRejectsEmptyList(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	if PermitNetworks(console, nil) == true {
		t.Fatal("PermitNetworks succeeded for an empty list")
	}

}
