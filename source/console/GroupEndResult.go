package console

import "fmt"

func GroupEndResult(result bool, message string) {

	if OFFSET > 0 {
		OFFSET = OFFSET - 1
	}

	message = sanitize(message)
	offset := toOffset()

	if result == true {
		message += " succeeded"
		Messages = append(Messages, NewMessage("GroupEnd", message))
		fmt.Println("\u001b[42m" + offset + "\\ " + message + "\u001b[K\u001b[0m")
		fmt.Println("\u001b[42m" + offset + "\u001b[K\u001b[0m")
	} else {
		message += " failed"
		Messages = append(Messages, NewMessage("GroupEnd", message))
		fmt.Println("\u001b[41m" + offset + "\\ " + message + "\u001b[K\u001b[0m")
		fmt.Println("\u001b[41m" + offset + "\u001b[K\u001b[0m")
	}

}
