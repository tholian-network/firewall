# Testing

The `guard` test suites require the embedded Internet dataset at
`source/insights/Internet.json.gz`. It is intentionally not tracked by Git; see
[README.md](../README.md#building). The Makefile targets fail early if it is
missing.

The eBPF firewall is tested with Go tests in two separate layers:

- `source/tests/` contains in-process integration tests that need access to the
  eBPF module and ban maps. They are compiled into a single binary with
  `go test -c`.
- `e2e-tests/` is a standalone Go module that executes the compiled CLI binary
  as an external process. It covers CLI behavior, exit codes, search output,
  and the self-test.

## Targets

```bash
make help;              # list all targets
make check;             # formatting, vet, and unit tests
make test;              # unit tests + eBPF build + in-process integration suite
make test-e2e;          # external CLI end-to-end suite
make test-with-log;     # integration suite, logged to logs/test.log
make test-e2e-with-log; # end-to-end suite, logged to logs/test_e2e.log
make test-all;          # both test and test-e2e
```

`make test-with-log` writes the full log to `logs/test.log`.
`make test-e2e-with-log` writes to `logs/test_e2e.log`. Both print a final
`RESULT: PASS` or `RESULT: FAIL` line. The plain `make test` and
`make test-e2e` targets print to the terminal instead of a log file.

`make test-all` runs both suites even after a failure and reports the combined
result at the end. `make test`, `make test-e2e`, and `make test-all` report
failures through their exit status.

## Unit tests

Unit tests do not need root, but the `guard` build still requires the embedded
Internet dataset:

```bash
make check;
```

This target runs formatting, vet, and the unit tests. The unit test command it
runs is:

```bash
cd source;
go test -tags guard -race -cover ./...;
```

Formatting and static analysis are part of `make check` as well; there are no
separate `fmt` or `vet` targets.

## Integration tests (`source/tests`)

The in-process suite is compiled into one binary because BPF maps and XDP links
are process-scoped:

```bash
make test;
```

The target runs the unit tests, builds `build/linux/tholian-firewall-tests`,
and runs it under `sudo` with `THOLIAN_TEST_ATTACH` (default `1`). To skip the
intrusive attach test:

```bash
make test THOLIAN_TEST_ATTACH=0;
```

The equivalent manual invocation is:

```bash
cd source;
go test -c -tags guard -o ../build/linux/tholian-firewall-tests ./tests;
sudo env THOLIAN_TEST_ATTACH=1 ../build/linux/tholian-firewall-tests -test.v;
```

- `go test -c` produces one self-contained test binary.
- `-tags guard` selects the real eBPF backend (instead of the stubs).
- Tests skip themselves when not running as root, so `go test -tags guard ./...`
  is safe to run without privileges.

| Test                                | What it checks                                                                |
|-------------------------------------|-------------------------------------------------------------------------------|
| `TestModuleLoad`                    | `xdp_prog_main`, maps load; verifier accepts the program; `SUPPORTED` is true |
| `TestAddressRoundTrip`              | forbid/lookup/permit for IPv4                                                 |
| `TestIPv6AddressRoundTrip`          | forbid/lookup/permit for IPv6                                                 |
| `TestSubnetRoundTrip`               | LPM trie longest-prefix match for `/24` covering `/32`                        |
| `TestPortRoundTrip`                 | forbid/lookup/permit for ports                                                |
| `TestDomainRoundTrip`               | FNV-1a domain key, case-insensitive matching                                  |
| `TestSocketRoundTrip`               | forbid/lookup/permit for exact `IP:port` sockets (IPv4/IPv6)                  |
| `TestConnectionBansExactSocket`     | `IP:port` does not over-ban the whole address                                 |
| `TestSocketDrop`                    | packet-level drop for a banned socket and pass for another port               |
| `TestDNSDrop`                       | crafted DNS response for a banned domain returns `XDP_DROP`                   |
| `TestDomainResolutionInstall`       | resolved A/AAAA addresses are installed and removed by permit                 |
| `TestStatusIncludesPortsDomains...` | status reports port, domain, and socket bans                                  |
| `TestNmapFinScanDrops`              | FIN-scan heuristic drops the crafted packet                                   |
| `TestTruncatedPacketPasses`         | malformed/truncated packets fail open                                         |
| `TestAttachAll`                     | attaches XDP to all non-loopback interfaces (opt-in)                          |

`TestAttachAll` is gated behind `THOLIAN_TEST_ATTACH=1` because attaching XDP to
the host interfaces is intrusive. `make test` enables it by default. The
round-trip tests permit everything they forbid, so the maps are clean before the
attach test runs.

Unit tests also cover parsers, fuzz seeds (`FuzzParseIPv4`, `FuzzParseIPv6`,
`FuzzParseDomain`), the `structs.Internet` fixture, the gzip/JSON loader, eBPF
key encoders, rule-file parsing, and the pure `utils` helpers.

The real embedded dataset is validated by an opt-in smoke test:

```bash
cd source;
THOLIAN_TEST_DATASET=1 go test -tags guard ./insights -run TestEmbeddedInternetDataset -v;
```

## End-to-end tests (`e2e-tests`)

`e2e-tests/` is a separate module that runs the compiled CLI as an external
process. It does not import `source/` packages. The suite covers:

- usage output and exit codes for missing or unknown actions,
- the `status` command,
- IPv4 and ASN search output,
- invalid search targets,
- the `selftest` command, gated by `THOLIAN_TEST_ATTACH=1`.

Run it with:

```bash
make test-e2e;
```

The target builds `build/linux/tholian-firewall-guard-amd64` and
`build/linux/tholian-firewall-e2e`, then executes the test binary with
`THOLIAN_FIREWALL_BIN` pointing at the CLI. Run it without `sudo`; the target
builds as your user and executes the test binary via `sudo`.

To skip the intrusive self-test:

```bash
make test-e2e THOLIAN_TEST_ATTACH=0;
```

The tests can also be run directly from the module:

```bash
cd e2e-tests;
THOLIAN_FIREWALL_BIN=../build/linux/tholian-firewall-guard-amd64 go test -v ./...;
```

## Continuous integration

A typical CI split is:

```bash
make check;
make build-cli;
make test;     # requires root or sudo and a BPF-capable kernel
make test-e2e; # requires root or sudo and a BPF-capable kernel
```

Unit tests and cross-builds can run on ordinary CI workers. Privileged
integration and e2e tests remain a local/self-hosted step because they need root
and a BPF-capable kernel.

## Why not just CLI invocations for everything?

Each CLI invocation is a separate process, and XDP links/maps are process-scoped
and not pinned yet. State created by `forbid` in one invocation is gone when it
exits, so `forbid` followed by `check` in a second invocation cannot observe it.
Running the map assertions inside one Go test binary keeps everything in a single
process and makes them meaningful. (The `selftest` CLI action exists for the same
reason.)

The external CLI tests in `e2e-tests/` therefore cover behavior that is
meaningful across process boundaries: usage, exit codes, search output, status,
and the self-test. The in-process suite in `source/tests/` covers map and packet
state.

## Interpreting failures

- `failed to set memlock rlimit` / `map create: operation not permitted` because of not running as root or lacking `CAP_BPF`. Run the test binary via `sudo`.
- `invalid access to packet ...` / verifier errors because of a bug in `module.c` or `module.h`; the verifier log is in the test output and, when using `make test-with-log`, in `logs/test.log`.
- `requires root with CAP_BPF/CAP_NET_ADMIN` because expected skip when not root.
- `ebpf module failed to load: ...` then inspect the earlier lines in the log for the concrete load/verifier error.
- A missing `e2e-tests/go.mod` or `THOLIAN_FIREWALL_BIN` error means the e2e binary was run outside `make test-e2e`; build the CLI first and set the environment variable explicitly.
