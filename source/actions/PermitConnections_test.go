package actions

import "testing"
import "tholian-core/structs"

func TestPermitConnectionsRejectsEmptyList(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	if PermitConnections(console, nil) == true {
		t.Fatal("PermitConnections succeeded for an empty list")
	}

}
