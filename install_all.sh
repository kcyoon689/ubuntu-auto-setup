#!/bin/bash
set -e

# Default versions
NVIDIA_DRIVER_VERSION=""
CUDA_VERSION="12.2"
TORCH_VERSION="2.2.2"
TORCH_CUDA_VERSION="12.1"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --nvidia-driver)
      NVIDIA_DRIVER_VERSION="$2"
      shift 2
      ;;
    --cuda)
      CUDA_VERSION="$2"
      shift 2
      ;;
    --torch)
      TORCH_VERSION="$2"
      shift 2
      ;;
    --torch-cuda)
      TORCH_CUDA_VERSION="$2"
      shift 2
      ;;
    *)
      echo "❌ Unknown argument: $1"
      exit 1
      ;;
  esac
done

sudo apt update

echo "🔧 Starting full Ubuntu environment setup..."
sudo true  # Request sudo once at the beginning

##############################
### 1. NVIDIA + CUDA + PyTorch
##############################

echo "[1/4] Installing NVIDIA Driver, CUDA Toolkit, and PyTorch..."
if [[ -z "$NVIDIA_DRIVER_VERSION" ]]; then
  bash scripts/nvidia-driver_install.sh
else
  bash scripts/nvidia-driver_install.sh "$NVIDIA_DRIVER_VERSION"
fi

bash scripts/cuda_install.sh "$CUDA_VERSION"
bash scripts/torch_install.sh "$TORCH_VERSION" "$TORCH_CUDA_VERSION"

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
