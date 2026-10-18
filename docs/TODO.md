### Firewall Core / CLI

- [ ] Wire `Init`/`Attach` automatically from the CLI (currently explicit `init`)
- [ ] Use `utils.IsBPF` in the bridge pre-check
- [ ] Expose `iptables.Flush` as a CLI/action for stale fallback rules

### DNS Filtering

- [ ] Support for DNS-over-TCP
- [ ] Verifier test of the DNS parsing path on hardware
- [ ] Disallow DoH/DoT to avoid bypasses
- [ ] DNS TXT exfiltration detection

## Future Work

- [ ] Daemon / IPC mode so a long-running firewall can be controlled by the CLI
- [ ] Structured logging persisted to disk. The `structs.Console.Messages`
  pipeline is already there, it just needs a writer
- [ ] TC/clsact egress program for outbound (`client`/`OUTPUT`) enforcement
- [ ] Map and link pinning and persistence so bans and attachment survive
  restarts and work across CLI invocations
