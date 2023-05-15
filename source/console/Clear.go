package console

import "fmt"

func Clear() {

	Messages = append(Messages, NewMessage("Clear", ""))

	// clear screen and reset cursor
	fmt.Print("\u001b[2J\u001b[0f")

	// clear scroll buffer
	fmt.Print("\u001b[3J")

}
