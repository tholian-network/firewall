package console

import "strings"

var OFFSET int = 0

func sanitize(message string) string {

	var result string = message

	result = strings.ReplaceAll(result, "\t", "    ")

	return result

}

func toOffset() string {

	var offset string

	if OFFSET > 0 {

		offset = "|"

		for o := 1; o < OFFSET; o++ {
			offset = offset + "|"
		}

	}

	return offset

}
