package console

import "fmt"
import "strconv"

func ClearLines(number int) {

	if number < 32 {

		// move up x lines
		fmt.Print("\033[" + strconv.Itoa(number) + "A")

		// clear from cursor to end of screen
		fmt.Print("\033[J")

	}

}
