#!/bin/bash
set -e

### 1. Update system packages
sudo apt update && sudo apt upgrade -y

### 2. Install required dependencies
sudo apt install -y build-essential dkms wget gnupg software-properties-common


### 3. Determine driver version
DRIVER_VERSION="$1"

if [[ -z "$DRIVER_VERSION" ]]; then
  echo "[✔] No specific driver version provided. Running autoinstall..."
  sudo ubuntu-drivers autoinstall
else
  echo "[✔] Installing NVIDIA Driver $DRIVER_VERSION..."
  sudo apt install -y "nvidia-driver-${DRIVER_VERSION}"
fi

echo "[✔] NVIDIA Driver installation completed."
echo "👉 A system reboot is required to apply the driver changes."
read -p "Would you like to reboot now? (y/n): " answer
if [[ "$answer" == [Yy] ]]; then
    sudo reboot
else
    echo "⚠️ Please reboot the system manually before proceeding."
fi