package utils

import "strconv"
import "strings"

func IsIPv6(value string) bool {

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

	} else if strings.Contains(value, ":") {

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
