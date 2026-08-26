# NOTE: the default port 5000 collides with macOS's AirPlay Receiver
# (ControlCenter). If you see a 403 signaling error, pass a different port,
# e.g. `just simple-box-server 5123` / `just simple-box-client 5123`.

# Run the simple_box example as the host/server.
simple-box-server port="5000":
    cargo run --example simple_box --features signaling -- server --port {{port}}

# Run the simple_box example as a client (run simple-box-server first).
simple-box-client port="5000":
    cargo run --example simple_box --features signaling -- client --port {{port}}
