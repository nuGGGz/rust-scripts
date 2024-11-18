#!/bin/bash

# Variables
RUST_SERVER_DIR="/home/steam/rust_server"
RUST_EXECUTABLE="$RUST_SERVER_DIR/RustDedicated"
SERVER_NAME="MyRustServer"
SERVER_PORT=28015
RCON_PORT=28016
RCON_PASSWORD="changeme" # Replace this with a secure password

# Start server
echo "Starting Rust server..."
cd "$RUST_SERVER_DIR"
"$RUST_EXECUTABLE" -batchmode -nographics \
    +server.port "$SERVER_PORT" \
    +rcon.port "$RCON_PORT" \
    +rcon.password "$RCON_PASSWORD" \
    +server.identity "rust_server" \
    +server.seed 12345 \
    +server.name "$SERVER_NAME" \
    +server.worldsize 3000 \
    +server.saveinterval 300
