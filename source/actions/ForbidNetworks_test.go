package actions

import "testing"
import "tholian-firewall/structs"

func TestForbidNetworksRejectsEmptyList(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	if ForbidNetworks(console, nil) == true {
		t.Fatal("ForbidNetworks succeeded for an empty list")
	}

}
