#!/bin/bash
set -e

### 1. Set the Miniconda version and installer name
MINICONDA_VERSION=py311_24.1.2-0
INSTALLER_NAME=Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh

### 2. Download Miniconda installer
echo "[✔] Downloading Miniconda installer..."
wget https://repo.anaconda.com/miniconda/${INSTALLER_NAME} -O ${INSTALLER_NAME}

### 3. Run the installer silently to ~/miniconda3
echo "[✔] Installing Miniconda to ~/miniconda3..."
bash ${INSTALLER_NAME} -b -p $HOME/miniconda3

### 4. Initialize conda for bash
echo "[✔] Initializing Conda..."
eval "$($HOME/miniconda3/bin/conda shell.bash hook)"
conda init

### 5. Clean up installer
rm -f ${INSTALLER_NAME}

### 6. Confirm installation
echo "[✔] Miniconda installation completed."
conda --version

### 7. Disable auto-activation of base environment
echo "[✔] Disabling auto-activation of base environment..."
conda config --set auto_activate_base false

### 8. Final message
echo "Please restart your terminal or run the following command to activate conda:"
echo "source ~/.bashrc"
