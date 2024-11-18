#!/bin/bash

# Variables
STEAM_HOME="/home/rust"
STEAMCMD_DIR="$STEAM_HOME/steamcmd"
RUST_SERVER_DIR="$STEAM_HOME/rust_server"
STEAM_USER="anonymous"
STEAM_APP_ID=258550

# Ensure script is run as 'steam' user
if [ "$(whoami)" != "rust" ]; then
    echo "This script must be run as the 'rust' user. Exiting."
    exit 1
fi

# Step 1: Install Dependencies
echo "Installing dependencies..."
sudo apt update && sudo apt install -y steamcmd lib32gcc-s1 lib32stdc++6

# Step 2: Create Directories
echo "Setting up directories..."
mkdir -p "$STEAMCMD_DIR" "$RUST_SERVER_DIR"

# Step 3: Install SteamCMD
echo "Installing SteamCMD..."
cd "$STEAMCMD_DIR"
if [ ! -f "steamcmd.sh" ]; then
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    tar -xvzf steamcmd_linux.tar.gz
fi

# Step 4: Install Rust Server
echo "Installing Rust server..."
"$STEAMCMD_DIR/steamcmd.sh" +force_install_dir "$RUST_SERVER_DIR" +login "$STEAM_USER" +app_update "$STEAM_APP_ID" validate +quit

if [ $? -eq 0 ]; then
    echo "Rust server successfully installed in $RUST_SERVER_DIR."
else
    echo "Failed to install Rust server. Check the output for errors."
    exit 1
fi
