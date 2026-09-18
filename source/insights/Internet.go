package insights

import "tholian-firewall/structs"

var Internet structs.Internet

var initialize func(console *structs.Console) = func(console *structs.Console) {}

func Init(console *structs.Console) {
	initialize(console)
}
