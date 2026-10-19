package actions

import "testing"
import "tholian-core/structs"

func TestForbidWithoutBackend(t *testing.T) {

	restore := disable_backends()
	defer restore()

	console := structs.NewConsole(nil, nil, 0)

	if Forbid(console, "1.3.3.7") == true {
		t.Fatal("Forbid succeeded without a backend")
	}

}

func TestForbidInvalidTargets(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	for _, target := range []string{"", "1.3.3.7/33", "[fe80::1]/129", "1.3.3.7:0"} {

		if Forbid(console, target) == true {
			t.Errorf("Forbid(%q) succeeded", target)
		}

	}

}
