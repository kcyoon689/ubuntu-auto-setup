#!/bin/bash
set -e

sudo apt update

### 1. Download the CUDA 12.2 local installer (Ubuntu 22.04)
echo "[✔] Downloading CUDA 12.2 local installer..."
wget https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.2-535.104.05-1_amd64.deb

### 2. Install the CUDA repository package
echo "[✔] Installing CUDA repository package..."
sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.2-535.104.05-1_amd64.deb

### 3. Add GPG key
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/

### 4. Update APT package index
sudo apt update

### 5. Install CUDA
echo "[✔] Installing CUDA 12.2..."
sudo apt install -y cuda

### 6. Add environment variables to ~/.bashrc
echo "[✔] Configuring environment variables..."
if ! grep -q 'cuda-12.2' ~/.bashrc; then
  echo 'export PATH=/usr/local/cuda-12.2/bin:$PATH' >> ~/.bashrc
  echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
fi

### 7. Apply the changes
source ~/.bashrc

### 8. Confirm CUDA installation
echo "[✔] CUDA installation completed."
nvcc -V
