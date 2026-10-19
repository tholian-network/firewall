package actions

import "testing"
import "tholian-core/structs"

func TestStatusWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if len(Status(console)) != 0 {
		t.Fatal("Status reported entries without a backend")
	}

}
