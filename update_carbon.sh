#!/bin/bash

# Variables
CARBON_URL="https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Linux.Release.tar.gz"
CARBON_ARCHIVE="/home/rust/Carbon.Linux.Release.tar.gz"
RUST_DATA_DIR="/home/rust/rust_server/RustDedicated_Data"
ENV_SCRIPT="$RUST_DATA_DIR/carbon/tools/environment.sh"

# Ensure script is run as 'steam' user
if [ "$(whoami)" != "rust" ]; then
    echo "This script must be run as the 'rust' user. Exiting."
    exit 1
fi

# Step 1: Download the Carbon mod
echo "Downloading Carbon mod..."
wget -O "$CARBON_ARCHIVE" "$CARBON_URL"
if [ $? -ne 0 ]; then
    echo "Failed to download Carbon mod. Check the URL or your internet connection."
    exit 1
fi

# Step 2: Extract the archive to RustDedicated_Data directory
echo "Extracting Carbon mod to $RUST_DATA_DIR..."
tar -xvzf "$CARBON_ARCHIVE" -C "$RUST_DATA_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to extract Carbon mod. Check the archive or permissions."
    exit 1
fi

# Step 3: Load the Carbon environment
if [ -f "$ENV_SCRIPT" ]; then
    echo "Loading Carbon environment..."
    source "$ENV_SCRIPT"
else
    echo "Environment script not found at $ENV_SCRIPT. Check your installation."
    exit 1
fi

# Step 4: Clean up
echo "Cleaning up temporary files..."
rm -f "$CARBON_ARCHIVE"

echo "Carbon mod successfully updated and configured in $RUST_DATA_DIR!"
