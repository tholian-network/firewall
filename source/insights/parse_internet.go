package insights

import "compress/gzip"
import "tholian-core/structs"
import "encoding/json"
import "io"

func parse_internet(reader io.Reader) error {

	decompressed, err := gzip.NewReader(reader)

	if err != nil {
		return err
	}

	defer decompressed.Close()

	buffer, err := io.ReadAll(decompressed)

	if err != nil {
		return err
	}

	internet := structs.NewInternet()

	if err := json.Unmarshal(buffer, &internet); err != nil {
		return err
	}

	Internet = internet

	return nil

}
