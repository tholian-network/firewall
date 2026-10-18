package console

import "strings"
import "testing"

func TestHighlightValues(t *testing.T) {

	cases := []struct {
		line  string
		color string
	}{
		{"true", palette["bool"]},
		{"false", palette["bool"]},
		{"1338", palette["number"]},
		{"-1.5E3", palette["number"]},
		{"\"value\"", palette["string"]},
		{"null", palette["keyword"]},
		{"[]", palette["literal"]},
		{"{}", palette["literal"]},
		{"plain", palette["default"]},
	}

	for _, c := range cases {

		result := Highlight(c.line)

		if strings.HasPrefix(result, c.color) == false {
			t.Errorf("Highlight(%q) = %q, expected prefix %q", c.line, result, c.color)
		}

	}

}

func TestHighlightKeyValue(t *testing.T) {

	result := Highlight("\"key\": 1338,")

	if strings.Contains(result, palette["string"]) == false {
		t.Errorf("highlighted key does not use the string palette: %q", result)
	}

	if strings.Contains(result, palette["number"]) == false {
		t.Errorf("highlighted value does not use the number palette: %q", result)
	}

	if strings.HasSuffix(result, palette["default"]+",") == false {
		t.Errorf("highlighted suffix is wrong: %q", result)
	}

}

func TestHighlightPreservesIndentation(t *testing.T) {

	result := Highlight("    \"key\": true")

	if strings.HasPrefix(result, "    ") == false {
		t.Errorf("Highlight lost indentation: %q", result)
	}

}
