package console

import "fmt"

func Group(message string) {

	offset := toOffset()
	OFFSET = OFFSET + 1

	message = sanitize(message)
	Messages = append(Messages, NewMessage("Group", message))

	fmt.Println("\u001b[40m" + offset + "\u001b[K\u001b[0m")
	fmt.Println("\u001b[40m" + offset + "/ " + message + "\u001b[K\u001b[0m")

}
