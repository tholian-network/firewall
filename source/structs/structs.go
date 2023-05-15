package structs

import "strconv"
import "strings"

func isDomain(value string) bool {

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

func isIPv4(value string) bool {

	if strings.Contains(value, ".") {

		var chunks = strings.Split(value, ".")
		var valid bool = true

		if len(chunks) == 4 {

			for c := 0; c < len(chunks); c++ {

				_, err := strconv.ParseUint(chunks[c], 10, 8)

				if err != nil {
					valid = false
					break
				}

			}

		}

		return valid

	}

	return false

}

func isIPv6(value string) bool {

	if strings.HasPrefix(value, "[") && strings.HasSuffix(value, "]") {

		var chunks = strings.Split(value[1:len(value)-1], ":")
		var valid bool = true

		if len(chunks) == 8 {

			for c := 0; c < len(chunks); c++ {

				_, err := strconv.ParseUint(chunks[c], 16, 64)

				if err != nil {
					valid = false
					break
				}

			}

		}

		return valid

	}

	return false

}
