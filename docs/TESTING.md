# Testing

The eBPF firewall is tested with Go tests. The integration tests live in
`source/tests/` and can be compiled into a single binary with `go test -c`:

```bash
cd source;
go test -c -tags guard -o ../build/linux/tholian-firewall-tests ./tests;
sudo env THOLIAN_TEST_ATTACH=1 ../build/linux/tholian-firewall-tests -test.v;
```

- `go test -c` produces one self-contained test binary.
- `-tags guard` selects the real eBPF backend (instead of the stubs).
- Tests skip themselves when not running as root, so `go test -tags guard ./...`
  is safe to run without privileges.

## One-shot runner

`test.sh` at the repository root automates everything and writes the full log
to `logs/test.log`:

```bash
cd /path/to/tholian-firewall;
bash test.sh;
```

It runs, in order:

1. `go test -tags guard ./...` (unit tests for `types`/`matchers`, as your
   user).
2. `bash make.sh ebpf` (compile with `-DENABLE_DNSFILTER`).
3. `go build -tags guard` for the CLI (`build/linux/tholian-firewall-guard-amd64`).
4. `go test -c -tags guard -o build/linux/tholian-firewall-tests ./tests`.
5. The test binary under `sudo` with `-test.v` (this is where the verifier,
   load, attach, and map round-trips are exercised).
6. Two CLI smoke tests (`status`, `search 1.1.1.1`).

The script prompts for your `sudo` password. The prompt goes to the TTY, so it
is not captured in the log. The final line reports `RESULT: PASS` or
`RESULT: FAIL`.

## Integration tests (`source/tests`)

| Test                       | What it checks                                                                |
|----------------------------|-------------------------------------------------------------------------------|
| `TestModuleLoad`           | `xdp_prog_main`, maps load; verifier accepts the program; `SUPPORTED` is true |
| `TestAddressRoundTrip`     | forbid/lookup/permit for IPv4                                                 |
| `TestIPv6AddressRoundTrip` | forbid/lookup/permit for IPv6                                                 |
| `TestSubnetRoundTrip`      | LPM trie longest-prefix match for `/24` covering `/32`                        |
| `TestPortRoundTrip`        | forbid/lookup/permit for ports                                                |
| `TestDomainRoundTrip`      | FNV-1a domain key, case-insensitive matching                                  |
| `TestAttachAll`            | attaches XDP to all non-loopback interfaces (opt-in)                          |

`TestAttachAll` is gated behind `THOLIAN_TEST_ATTACH=1` because attaching XDP to
the host interfaces is intrusive. `test.sh` enables it by default; set
`THOLIAN_TEST_ATTACH=0 bash test.sh` to skip it. The round-trip tests permit
everything they forbid, so the maps are clean before the attach test runs.

## Why not just CLI invocations?

Each CLI invocation is a separate process, and XDP links/maps are process-scoped
and not pinned yet. State created by `forbid` in one invocation is gone when it
exits, so `forbid` followed by `check` in a second invocation cannot observe it.
Running the checks inside one Go test binary keeps everything in a single
process and makes the assertions meaningful. (The `selftest` CLI action exists
for the same reason.)

## Interpreting failures

- `failed to set memlock rlimit` / `map create: operation not permitted` because of not running as root or lacking `CAP_BPF`. Run the test binary via `sudo`.
- `invalid access to packet ...` / verifier errors because of a bug in `module.c` or `module.h`; the verifier log is in the test output and `logs/test.log`.
- `requires root with CAP_BPF/CAP_NET_ADMIN` because expected skip when not root.
- `ebpf module failed to load: ...` then inspect the earlier lines in the log for the concrete load/verifier error.
