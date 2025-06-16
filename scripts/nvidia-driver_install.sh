#!/bin/bash
set -e

### 1. Update system packages
sudo apt update && sudo apt upgrade -y

### 2. Install required dependencies
sudo apt install -y build-essential dkms wget gnupg software-properties-common

### 3. Install NVIDIA Driver 535
echo "[✔] Installing NVIDIA Driver 535..."
sudo apt install -y nvidia-driver-535

echo "[✔] NVIDIA Driver 535 installation completed."
echo "👉 A system reboot is required to apply the driver changes."
read -p "Would you like to reboot now? (y/n): " answer
if [[ "$answer" == [Yy] ]]; then
    sudo reboot
else
    echo "⚠️ Please reboot the system manually before proceeding with CUDA installation."
fi
