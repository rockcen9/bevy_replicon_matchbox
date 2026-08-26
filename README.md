# Bevy Replicon Matchbox

This crate integrates [`matchbox`](https://github.com/johanhelsing/matchbox) as a backend for [`bevy_replicon`](https://github.com/komora-io/bevy_replicon), enabling multiplayer experiences which only need a signaling server to work.

Matchbox provides convenient NAT traversal support out of the box — no need to manually manage signaling, host discovery, or ICE negotiation.

> ⚠️ **Note**: This is an early implementation and may still contain bugs or limitations.

---

## Running an Example

To run one of the examples from the [`examples`](examples) directory:

```bash
cargo run --example <example_name> server
```

in another terminal
```bash
cargo run --example <example_name> client
```

Each example starts a host peer that also acts as the listen server.

For production setups, it’s recommended to use a dedicated matchbox signaling server.



### Known Limitations

- **Empty message workaround**  
  WebRTC can silently drop empty messages. To prevent this, each message is currently prefixed with a single `byte` to ensure delivery.


- **WASM support not verified (yet)**  
  This backend has not been tested in WebAssembly environments. Compatibility is currently unverified.

## Compatible versions

| bevy | bevy_matchbox | bevy_replicon | bevy_replicon_matchbox |
|------|---------------|---------------|------------------------|
| 0.19 | 0.15 (git)    | 0.42          | main                   |
| 0.16 | 0.12          | 0.34          | 0.16                   |

> ⚠️ **Bevy 0.19 note**: no released `bevy_matchbox` supports Bevy 0.19 yet, so this
> branch pins `bevy_matchbox` to a git rev from
> [AdamWhitehurst/matchbox](https://github.com/AdamWhitehurst/matchbox/) (the `bevy-0.19-port`
> branch, tracking upstream [johanhelsing/matchbox#557](https://github.com/johanhelsing/matchbox/pull/557)).
> A crate with a git dependency cannot be published to crates.io, so this crate is
> **not publishable** until that PR merges and `bevy_matchbox` 0.15 is released.


## License

Licensed under either of [Apache License, Version 2.0](LICENSE-APACHE) or [MIT License](LICENSE-MIT) at your option.