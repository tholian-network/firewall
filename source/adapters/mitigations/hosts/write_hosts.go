package hosts

import "tholian-core/structs"
import "path/filepath"
import "os"

func write_hosts(console *structs.Console, buffer []byte) bool {

	mode := os.FileMode(0644)

	info, err := os.Stat(hostsPath)

	if err == nil {
		mode = info.Mode().Perm()
	}

	target := hostsPath

	resolved, err := filepath.EvalSymlinks(hostsPath)

	if err == nil {
		target = resolved
	}

	directory := filepath.Dir(target)

	temp, err := os.CreateTemp(directory, ".tholian-hosts-*")

	if err != nil {
		console.Error("adapters/hosts: " + err.Error())
		return false
	}

	tempName := temp.Name()

	cleanup := func() {
		temp.Close()
		os.Remove(tempName)
	}

	if _, err := temp.Write(buffer); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		cleanup()
		return false
	}

	if err := temp.Sync(); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		cleanup()
		return false
	}

	if err := temp.Close(); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	if err := os.Chmod(tempName, mode); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	if err := os.Rename(tempName, target); err != nil {
		console.Error("adapters/hosts: " + err.Error())
		os.Remove(tempName)
		return false
	}

	return true

}
