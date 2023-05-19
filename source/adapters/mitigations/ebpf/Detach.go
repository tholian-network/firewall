package ebpf

func Detach(name string) bool {

	_, ok := LINKS[name]

	if ok == true {

		ref := *LINKS[name]
		ref.Close()

		delete(LINKS, name)

		return true

	} else {

		return true

	}

}

