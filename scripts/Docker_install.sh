#!/bin/bash
set -e

echo "[✔] Step 1: Updating existing packages and installing dependencies..."
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

echo "[✔] Step 2: Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "[✔] Step 3: Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[✔] Step 4: Updating package index with Docker repository..."
sudo apt update

echo "[✔] Step 5: Installing Docker Engine, CLI, and container runtime..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[✔] Step 6: Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[✔] Step 7: Verifying Docker installation..."
sudo docker version
sudo docker run hello-world

echo "[✔] Docker has been installed and tested successfully!"