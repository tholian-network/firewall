package actions

import "testing"
import "tholian-core/structs"

func TestForbidConnectionsRejectsEmptyList(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	if ForbidConnections(console, nil) == true {
		t.Fatal("ForbidConnections succeeded for an empty list")
	}

}
