package utils

import "tholian-firewall/console"
import "compress/gzip"
import "io/ioutil"
import "os"
import "strings"

var bpf_required_options map[string]string = map[string]string{
	"CONFIG_CGROUP_BPF":      "y",
	"CONFIG_BPF":             "y",
	"CONFIG_BPF_LSM":         "y",
	"CONFIG_BPF_SYSCALL":     "y",
	"CONFIG_BPF_EVENTS":      "y",
	"CONFIG_LSM":             "bpf",
	"CONFIG_FTRACE_SYSCALLS": "y",
	"CONFIG_HAVE_KPROBES":    "y",
	"CONFIG_KPROBES":         "y",
	"CONFIG_KPROBE_EVENTS":   "y",
}

func getKernelConfig() []byte {

	var result []byte

	handle1, err1 := os.Open("/proc/config.gz")
	defer handle1.Close()

	if err1 == nil {

		reader2, err2 := gzip.NewReader(handle1)
		defer reader2.Close()

		if err2 == nil {

			buffer3, err3 := ioutil.ReadAll(reader2)

			if err3 == nil {
				console.Log("Found kernel config in \"/proc/config.gz\"")
				result = buffer3
			}

		}

	} else {

		handle2, err2 := os.Open("/boot/config")
		defer handle2.Close()

		if err2 == nil {

			buffer3, err3 := ioutil.ReadAll(handle2)

			if err3 == nil {
				console.Log("Found kernel config in \"/boot/config\"")
				result = buffer3
			}

		} else {

			handle3, err3 := os.Open("/proc/version")
			defer handle3.Close()

			if err3 == nil {

				buffer4, err4 := ioutil.ReadAll(handle3)

				if err4 == nil {

					var check = strings.Split(string(buffer4), " ")

					if len(check) > 3 && check[0] == "Linux" && check[1] == "version" {

						handle5, err5 := os.Open("/boot/config-" + check[2])
						defer handle5.Close()

						if err5 == nil {

							buffer6, err6 := ioutil.ReadAll(handle5)

							if err6 == nil {
								console.Log("Found kernel config in \"/boot/config-" + check[2] + "\"")
								result = buffer6
							}

						}

					}

				}

			}

		}

	}

	return result

}

func IsBPF() bool {

	var buffer []byte = getKernelConfig()
	var config string = string(buffer)

	var options map[string]bool = make(map[string]bool)

	for key, _ := range bpf_required_options {
		options[key] = false
	}

	var lines []string = strings.Split(strings.TrimSpace(config), "\n")

	for l := 0; l < len(lines); l++ {

		var line = lines[l]

		if strings.HasPrefix(line, "#") {

			// Do Nothing

		} else if strings.Contains(line, "=") {

			var key = strings.TrimSpace(strings.Split(line, "=")[0])
			var tmp = strings.TrimSpace(strings.Split(line, "=")[1])

			var values []string

			if strings.HasPrefix(tmp, "\"") && strings.HasSuffix(tmp, "\"") {

				if strings.Contains(tmp, ",") {
					values = strings.Split(tmp[1:len(tmp) - 1], ",")
				} else {
					values = append(values, tmp[1:len(tmp) - 1])
				}

			} else {
				values = append(values, tmp)
			}

			_, exists1 := options[key]

			if exists1 == true {

				for v := 0; v < len(values); v++ {

					if values[v] == bpf_required_options[key] {
						options[key] = true
						break
					}

				}

			}

		}

	}

	var result bool = true

	for key, _ := range options {

		if options[key] == false {
			result = false
			break
		}

	}

	return result

}
