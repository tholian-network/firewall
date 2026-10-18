package actions

import "testing"
import "tholian-firewall/structs"

func TestSelfTestWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if SelfTest(console) == true {
		t.Fatal("SelfTest succeeded without a backend")
	}

}
