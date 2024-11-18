#!/bin/bash

# Variables
STEAMCMD_DIR="/home/steam/steamcmd"
RUST_SERVER_DIR="/home/steam/rust_server"
STEAM_USER="anonymous"
STEAM_APP_ID=258550

# Ensure script is run as 'steam' user
if [ "$(whoami)" != "steam" ]; then
    echo "This script must be run as the 'steam' user. Exiting."
    exit 1
fi

# Step 1: Update Rust Server
echo "Updating Rust server..."
"$STEAMCMD_DIR/steamcmd.sh" +force_install_dir "$RUST_SERVER_DIR" +login "$STEAM_USER" +app_update "$STEAM_APP_ID" validate +quit

if [ $? -eq 0 ]; then
    echo "Rust server successfully updated in $RUST_SERVER_DIR."
else
    echo "Failed to update Rust server. Check the output for errors."
    exit 1
fi
