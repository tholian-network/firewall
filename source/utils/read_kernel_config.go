package utils

import "os"

func read_kernel_config(path string) ([]byte, bool) {

	buffer, err := os.ReadFile(path)

	if err != nil {
		return nil, false
	}

	return buffer, true

}

