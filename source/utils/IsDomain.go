package utils

import "strings"

func IsDomain(value string) bool {

	if strings.Contains(value, ".") {

		var chunks = strings.Split(value, ".")
		var valid bool = true

		if len(chunks) >= 2 {

			valid = true

			for c := 0; c < len(chunks); c++ {

				var chunk = chunks[c]

				if len(chunk) >= 2 {
					// Do Nothing
				} else {
					valid = false
					break
				}

			}

		} else if len(chunks) == 1 {

			if len(chunks[0]) >= 3 {
				valid = true
			}

		}

		return valid

	}

	return false

}
