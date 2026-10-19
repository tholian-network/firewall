package actions

import "testing"
import "tholian-core/structs"

func TestInitWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if Init(console) == true {
		t.Fatal("Init succeeded without a backend")
	}

}
