package console

import "fmt"

func GroupEnd(message string) {

	if OFFSET > 0 {
		OFFSET = OFFSET - 1
	}

	message = sanitize(message)
	offset := toOffset()
	Messages = append(Messages, NewMessage("GroupEnd", message))

	fmt.Println("\u001b[40m" + offset + "\\ " + message + "\u001b[K\u001b[0m")
	fmt.Println("\u001b[40m" + offset + "\u001b[K\u001b[0m")

}
