package insights

import "tholian-core/structs"

var Internet structs.Internet

var initialize func(console *structs.Console) = func(console *structs.Console) {}

func Init(console *structs.Console) {
	initialize(console)
}
