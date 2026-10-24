package rules

import "testing"
import "tholian-core/structs"

func example_rule(records *[]string) func(*structs.Console, string) bool {

	return func(console *structs.Console, target string) bool {
		*records = append(*records, target)
		return true
	}

}

func TestLoadRulesWithCommentsAndSemicolons(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	forbidden := make([]string, 0)
	permitted := make([]string, 0)

	content := `
# full-line comment
forbid 1.3.3.7;
forbid 1.3.3.0/24; # inline comment

permit 8.8.8.8;
forbid evil.example; permit 1.1.1.1;
`

	if Load(console, content, example_rule(&forbidden), example_rule(&permitted)) == false {
		t.Fatalf("Load returned false: %v", console.Messages)
	}

	if len(forbidden) != 3 {
		t.Fatalf("expected 3 forbid rules, got %v", forbidden)
	}

	if len(permitted) != 2 {
		t.Fatalf("expected 2 permit rules, got %v", permitted)
	}

	if forbidden[0] != "1.3.3.7" || forbidden[1] != "1.3.3.0/24" || forbidden[2] != "evil.example" {
		t.Fatalf("unexpected forbid targets: %v", forbidden)
	}

	if permitted[0] != "8.8.8.8" || permitted[1] != "1.1.1.1" {
		t.Fatalf("unexpected permit targets: %v", permitted)
	}

	if console.HasErrors() == true {
		t.Fatal("valid rules produced errors")
	}

}

func TestLoadRulesRejectsInvalidStatements(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	called := false
	callback := func(*structs.Console, string) bool {
		called = true
		return true
	}

	content := `
deny 1.3.3.7;
forbid;
forbid 1.3.3.7 extra;
`

	if Load(console, content, callback, callback) == true {
		t.Fatal("Load accepted invalid rules")
	}

	if called == true {
		t.Fatal("callback was invoked for invalid rules")
	}

	if console.HasErrors() == false {
		t.Fatal("invalid rules did not produce console errors")
	}

}

func TestLoadRulesPropagatesFailures(t *testing.T) {

	console := structs.NewConsole(nil, nil, 0)

	failing := func(*structs.Console, string) bool {
		return false
	}

	if Load(console, "forbid 1.3.3.7;", failing, failing) == true {
		t.Fatal("Load ignored a failed rule")
	}

}
