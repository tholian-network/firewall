
### cilium Bridge

- [ ] Wire `Init`/`Attach` automatically from the CLI (currently explicit `init`)

### Firewall Core / CLI

- [ ] Use `utils.IsBPF` in the bridge pre-check
- [ ] Remove duplicate `matchers.Subnet`

### DNS Filtering

- [ ] Support for DNS-over-TCP
- [ ] Verifier test of the DNS parsing path on hardware
- [ ] Disallow DoH/DoT to avoid bypasses
- [ ] DNS TXT exfiltration detection

### Fallback Adapters

- [ ] Wire `hosts` fallback for bare domains
- [ ] Ensure fallback adapters work correctly
- [ ] Protocol-aware host+port handling
- [ ] Safe `/etc/hosts` managed-block editing

### Tests

- [ ] `structs.Internet` tests with a small fixture

## Future Work

- [ ] Daemon / IPC mode so a long-running firewall can be controlled by the CLI
- [ ] Structured logging persisted to disk. The `console.Messages` pipeline is
  already there, it just needs a writer
- [ ] TC/clsact egress program for outbound (`client`/`OUTPUT`) enforcement
- [ ] Map and link pinning and persistence so bans and attachment survive
  restarts and work across CLI invocations
