package utils

import "strconv"
import "strings"

func IsIPv4(value string) bool {

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

