# Rust Server Management Scripts

This repository contains bash scripts to automate the installation, update, and management of a dedicated Rust server on a Linux machine. These scripts assume you are using a `steam` user and that everything is managed within `/home/steam`.

## Prerequisites

- A `sudo`-enabled Linux user named `steam`.
- Sufficient disk space for the Rust server installation.
- Network access to download SteamCMD, Rust, and Carbon mod files.

---

## Scripts

### 1. `install_rust_server.sh`

This script installs a fresh Rust server using SteamCMD.

#### How to Use:
1. Ensure you're logged in as the `steam` user or run the script with `sudo -u steam`.
2. Execute the script:
   ```bash
   chmod +x install_rust_server.sh
   sudo -u steam bash install_rust_server.sh
   ```

#### What It Does:
- Installs SteamCMD.
- Downloads and installs the latest version of Rust from Steam using `steamcmd`.
- Sets up the Rust server directory (`/home/steam/rust_server`).

---

### 2. `update_rust_server.sh`

This script updates the installed Rust server to the latest version using SteamCMD.

#### How to Use:
1. Ensure you're logged in as the `steam` user or run the script with `sudo -u steam`.
2. Execute the script:
   ```bash
   chmod +x update_rust_server.sh
   sudo -u steam bash update_rust_server.sh
   ```

#### What It Does:
- Updates the existing Rust server installation to the latest version.
- Uses `steamcmd` to validate and update game files, overwriting any outdated files.

---

### 3. `start_rust_server.sh`

This script starts the Rust server in batch mode.

#### How to Use:
1. Ensure you have configured the `RustDedicated` executable path correctly.
2. Execute the script:
   ```bash
   chmod +x start_rust_server.sh
   sudo -u steam bash start_rust_server.sh
   ```

#### What It Does:
- Launches the Rust server (`RustDedicated -batchmode`) in the background.
- Starts the server using the settings specified in the server configuration.

---

### 4. `update_carbon.sh`

This script downloads and installs the latest version of the Carbon mod for Rust, and updates the `RustDedicated_Data` folder.

#### How to Use:
1. Ensure you're logged in as the `steam` user or run the script with `sudo -u steam`.
2. Execute the script:
   ```bash
   chmod +x update_carbon.sh
   sudo -u steam bash update_carbon.sh
   ```

#### What It Does:
- Downloads the latest `Carbon.Linux.Release.tar.gz` archive from GitHub.
- Extracts the files to the `/home/steam/rust_server/RustDedicated_Data` directory.
- Sources the `environment.sh` script from the Carbon mod to set up the environment.
- Cleans up the temporary downloaded archive after extraction.

---

## Directory Structure

- `/home/steam/steamcmd`: Directory where SteamCMD is installed.
- `/home/steam/rust_server`: Directory where the Rust server is installed.
- `/home/steam/rust_server/RustDedicated_Data`: Directory where game data and mods (e.g., Carbon) are stored.

---

## Notes

- Ensure the `steam` user has proper write permissions to the server directories (`/home/steam/rust_server` and `/home/steam/rust_server/RustDedicated_Data`).
- The scripts are designed for Linux-based systems.
- Make sure you have `wget`, `tar`, and other required utilities installed on the system.

---

## License

This repository is open-source and available under the MIT License.
