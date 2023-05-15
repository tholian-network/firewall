package utils

import "bytes"
import "encoding/json"

func ToJSON(instance any) string {

	var buffer bytes.Buffer

	result, err := json.MarshalIndent(instance, "", "\t")

	if err == nil {
		buffer.WriteString(string(result))
	}

	return buffer.String()

}
