package utils

import "strings"
import "testing"

func example_kernel_config(overrides map[string]string) string {

	lines := make([]string, 0)

	for key, value := range bpf_required_options {

		current := value

		if override, ok := overrides[key]; ok == true {
			current = override
		}

		if current == "bpf" {
			lines = append(lines, key+"=\"lockdown,yama,bpf\"")
		} else {
			lines = append(lines, key+"="+current)
		}

	}

	return strings.Join(lines, "\n")

}

func TestParseKernelConfigSupported(t *testing.T) {

	if parse_kernel_config(example_kernel_config(map[string]string{})) == false {
		t.Fatal("expected a complete BPF config to be supported")
	}

}

func TestParseKernelConfigMissingOption(t *testing.T) {

	config := example_kernel_config(map[string]string{
		"CONFIG_BPF_SYSCALL": "n",
	})

	if parse_kernel_config(config) == true {
		t.Fatal("expected a config without BPF syscall support to fail")
	}

}

func TestParseKernelConfigIgnoresComments(t *testing.T) {

	config := "# CONFIG_BPF is not set\n" + example_kernel_config(map[string]string{})

	if parse_kernel_config(config) == false {
		t.Fatal("comments should not affect the result")
	}

}
