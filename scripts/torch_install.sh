#!/bin/bash
set -e

sudo apt update
sudo apt install python3-pip -y

### 1. Install PyTorch 2.2.2 with CUDA 12.1 via pip
echo "[✔] Installing PyTorch 2.2.2 (CUDA 12.1) via pip..."
pip install torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2 --index-url https://download.pytorch.org/whl/cu121

### 2. Verify installation
echo "[✔] PyTorch installation completed. Checking CUDA availability..."
python -c "import torch; print(f'PyTorch version: {torch.__version__}'); print(f'CUDA available: {torch.cuda.is_available()}'); print(f'Device: {torch.cuda.get_device_name(0)}' if torch.cuda.is_available() else '')"
