package actions

import "testing"
import "tholian-firewall/structs"

func TestCheckWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if Check(console, "1.3.3.7") == true {
		t.Fatal("Check reported a ban without a backend")
	}

}

func TestCheckInvalidTargets(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	for _, target := range []string{"", "1.3.3.7/33", "[fe80::1]/129", "1.3.3.7:0"} {

		if Check(console, target) == true {
			t.Errorf("Check(%q) reported a ban", target)
		}

	}

}
