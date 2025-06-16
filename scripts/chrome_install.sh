#!/bin/bash
set -e

echo "[+] Downloading Google Chrome .deb..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "[+] Installing Chrome..."
sudo apt update
sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt-get install -f -y

rm -f google-chrome-stable_current_amd64.deb

echo "[✓] Chrome installation completed. Run with: google-chrome"