#!/bin/bash
set -e

echo "[✔] Step 1: Creating keyring directory..."
sudo mkdir -p /usr/share/keyrings

echo "[✔] Step 2: Adding NVIDIA Container Toolkit GPG key..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
  sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

echo "[✔] Step 3: Adding NVIDIA Container Toolkit APT repository..."
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list > /dev/null

echo "[✔] Step 4: Updating APT package list..."
sudo apt update

echo "[✔] Step 5: Installing NVIDIA Container Toolkit..."
sudo apt install -y nvidia-container-toolkit

echo "[✔] Step 6: Configuring Docker to use NVIDIA runtime..."
# (Optional) sudo nvidia-ctk runtime configure --runtime=docker

echo "[✔] Step 7: Restarting Docker daemon..."
sudo systemctl daemon-reexec
sudo systemctl restart docker

echo "[✔] Step 8: Verifying NVIDIA Docker integration..."
docker info | grep -i nvidia || echo "⚠️ NVIDIA runtime not detected in 'docker info'"
echo "Running nvidia-smi in container:"
sudo docker run --rm --gpus all nvidia/cuda:12.3.0-base-ubuntu22.04 nvidia-smi
