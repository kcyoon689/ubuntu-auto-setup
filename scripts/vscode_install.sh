#!/bin/bash

set -e

echo "[+] Installing prerequisites..."
sudo apt update -y
sudo apt install -y wget gpg apt-transport-https software-properties-common

echo "[+] Importing Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | \
sudo tee /usr/share/keyrings/microsoft.gpg > /dev/null

echo "[+] Adding Visual Studio Code APT repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

echo "[+] Updating package list..."
sudo apt update -y

echo "[+] Installing Visual Studio Code..."
sudo apt install -y code

echo "[✓] Visual Studio Code installation completed successfully!"
code --version