package utils

import "tholian-core/structs"

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

func IsBPF(console *structs.Console) bool {
	return parse_kernel_config(string(get_kernel_config(console)))
}
