package utils

import "bytes"
import "compress/gzip"
import "io"
import "os"

func read_compressed_kernel_config(path string) ([]byte, bool) {

	buffer, err := os.ReadFile(path)

	if err != nil {
		return nil, false
	}

	reader, err := gzip.NewReader(bytes.NewReader(buffer))

	if err != nil {
		return nil, false
	}

	defer reader.Close()

	config, err := io.ReadAll(reader)

	if err != nil {
		return nil, false
	}

	return config, true

}
