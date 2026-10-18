package actions

import "testing"
import "tholian-firewall/structs"

func TestPermitWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if Permit(console, "1.3.3.7") == true {
		t.Fatal("Permit succeeded without a backend")
	}

}

func TestPermitInvalidTargets(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	for _, target := range []string{"", "1.3.3.7/33", "[fe80::1]/129", "1.3.3.7:0"} {

		if Permit(console, target) == true {
			t.Errorf("Permit(%q) succeeded", target)
		}

	}

}
