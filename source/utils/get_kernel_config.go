package utils

import "tholian-firewall/structs"
import "os"
import "strings"

func get_kernel_config(console *structs.Console) []byte {

	if config, ok := read_compressed_kernel_config("/proc/config.gz"); ok == true {
		console.Log("Found kernel config in \"/proc/config.gz\"")
		return config
	}

	if config, ok := read_kernel_config("/boot/config"); ok == true {
		console.Log("Found kernel config in \"/boot/config\"")
		return config
	}

	version, err := os.ReadFile("/proc/version")

	if err == nil {

		fields := strings.Split(string(version), " ")

		if len(fields) > 3 && fields[0] == "Linux" && fields[1] == "version" {

			path := "/boot/config-" + fields[2]

			if config, ok := read_kernel_config(path); ok == true {
				console.Log("Found kernel config in \"" + path + "\"")
				return config
			}

		}

	}

	return nil

}

