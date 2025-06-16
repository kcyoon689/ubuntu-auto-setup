#!/bin/bash
set -e

sudo apt update

echo "🔧 Starting full Ubuntu environment setup..."
sudo true  # Request sudo once at the beginning

##############################
### 1. NVIDIA + CUDA + PyTorch
##############################

echo "[1/4] Installing NVIDIA Driver, CUDA Toolkit, and PyTorch..."
bash scripts/nvidia-driver_install.sh
bash scripts/cuda_install.sh
bash scripts/torch_install.sh

##############################
### 2. Docker + NVIDIA Container Toolkit
##############################

echo "[2/4] Installing Docker and NVIDIA Container Toolkit..."
bash scripts/Docker_install.sh
bash scripts/nvidia_docker_toolkit_install.sh

##############################
### 3. Python environment (Miniconda)
##############################

echo "[3/4] Installing Miniconda..."
bash scripts/miniconda_install.sh

##############################
### 4. ROS 2 Humble
##############################

echo "[4/4] Installing ROS 2 Humble..."
bash scripts/ROS2-humble_install.sh

##############################
### Extra Tools: Browser, Editor
##############################

echo "[+] Installing Chrome, VSCode, and Cursor..."
bash scripts/chrome_install.sh
bash scripts/vscode_install.sh
bash scripts/cursor_install.sh

##############################
### Final: Utilities
##############################

echo "[+] Installing basic utilities..."
bash scripts/utils_install.sh

echo "✅ All installations completed successfully."
echo "🔁 Please restart your terminal or run: source ~/.bashrc"
