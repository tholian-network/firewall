package console

import "fmt"
import "strings"

func Error(message string) {

	message = sanitize(message)
	offset := toOffset()

	Messages = append(Messages, NewMessage("Error", message))

	if strings.Contains(message, "\n") {

		var lines = strings.Split(message, "\n")

		for l := 0; l < len(lines); l++ {
			fmt.Println("\u001b[41m" + offset + " " + lines[l] + "\u001b[K")
		}

		fmt.Print("\u001b[0m")

	} else {
		fmt.Println("\u001b[41m" + offset + " " + message + "\u001b[K\u001b[0m")
	}

}
