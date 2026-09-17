package iptables

import "tholian-firewall/console"
import "tholian-firewall/types"
import "os/exec"
import "errors"
import "strings"
import "sync"

type managedRule struct {
	program string
	spec    []string
}

var managed []managedRule
var managedMutex sync.Mutex

func resolveProgram(address string) (string, string) {

	if types.IsIPv6(address) {

		ipv6 := types.ParseIPv6(address)

		if ipv6 != nil && programIPv6 != "" {
			return programIPv6, ipv6.String()
		}

	} else if types.IsIPv4(address) {

		ipv4 := types.ParseIPv4(address)

		if ipv4 != nil && programIPv4 != "" {
			return programIPv4, ipv4.String()
		}

	}

	return "", ""

}

func runForFamilies(callback func(program string) bool) bool {

	attempted := 0
	succeeded := 0

	if SUPPORTED_IPV4 == true {

		attempted = attempted + 1

		if callback(programIPv4) == true {
			succeeded = succeeded + 1
		}

	}

	if SUPPORTED_IPV6 == true {

		attempted = attempted + 1

		if callback(programIPv6) == true {
			succeeded = succeeded + 1
		}

	}

	return attempted > 0 && succeeded == attempted

}

func run(program string, args ...string) ([]byte, error) {

	if program == "" {
		return nil, errors.New("iptables program unavailable")
	}

	command := exec.Command(program, args...)
	output, err := command.CombinedOutput()

	if err != nil {

		console.Error("adapters/iptables: command failed \"" + program + " " + strings.Join(args, " ") + "\"")

		if len(output) > 0 {
			console.Error(strings.TrimSpace(string(output)))
		}

	}

	return output, err

}

func ruleExists(program string, args ...string) bool {

	if program == "" {
		return false
	}

	command := exec.Command(program, args...)
	output, err := command.CombinedOutput()

	if err == nil {
		return true
	}

	var exit *exec.ExitError

	if errors.As(err, &exit) == true && exit.ExitCode() == 1 {
		return false
	}

	console.Error("adapters/iptables: rule check failed \"" + program + " " + strings.Join(args, " ") + "\"")

	if len(output) > 0 {
		console.Error(strings.TrimSpace(string(output)))
	}

	return false

}

func equalSpec(a []string, b []string) bool {

	if len(a) != len(b) {
		return false
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			return false
		}
	}

	return true

}

func trackRule(program string, spec []string) {

	managedMutex.Lock()
	defer managedMutex.Unlock()

	for m := 0; m < len(managed); m++ {

		if managed[m].program == program && equalSpec(managed[m].spec, spec) == true {
			return
		}

	}

	managed = append(managed, managedRule{program: program, spec: append([]string{}, spec...)})

}

func untrackRule(program string, spec []string) {

	managedMutex.Lock()
	defer managedMutex.Unlock()

	for m := 0; m < len(managed); m++ {

		if managed[m].program == program && equalSpec(managed[m].spec, spec) == true {
			managed = append(managed[:m], managed[m+1:]...)
			return
		}

	}

}

func addRuleOnce(program string, spec ...string) bool {

	if program == "" {
		return false
	}

	check := append([]string{"-C"}, spec...)

	if ruleExists(program, check...) == true {
		trackRule(program, spec)
		return true
	}

	add := append([]string{"-A"}, spec...)

	if _, err := run(program, add...); err == nil {
		trackRule(program, spec)
		return true
	}

	return false

}

func deleteRuleOnce(program string, spec ...string) bool {

	if program == "" {
		return false
	}

	check := append([]string{"-C"}, spec...)

	if ruleExists(program, check...) == false {
		untrackRule(program, spec)
		return true
	}

	remove := append([]string{"-D"}, spec...)

	if _, err := run(program, remove...); err == nil {
		untrackRule(program, spec)
		return true
	}

	return false

}

func Status() []string {

	managedMutex.Lock()
	defer managedMutex.Unlock()

	var result []string

	for m := 0; m < len(managed); m++ {
		result = append(result, managed[m].program+" "+strings.Join(managed[m].spec, " "))
	}

	return result

}

func Flush() bool {

	managedMutex.Lock()
	rules := append([]managedRule{}, managed...)
	managed = nil
	managedMutex.Unlock()

	var result bool = true

	for r := 0; r < len(rules); r++ {

		remove := append([]string{"-D"}, rules[r].spec...)

		if _, err := run(rules[r].program, remove...); err != nil {
			result = false
		}

	}

	return result

}
