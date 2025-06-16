#!/bin/bash
set -e

echo "[✔] Updating package lists..."
sudo apt update

### 1. Install APT packages if not already installed
APT_PACKAGES=("htop" "git" "tmux")

for pkg in "${APT_PACKAGES[@]}"; do
  if dpkg -s "$pkg" &> /dev/null; then
    echo "[✔] $pkg is already installed."
  else
    echo "[+] Installing $pkg..."
    sudo apt install -y "$pkg"
  fi
done

### 2. Install Snap daemon if not present
if ! command -v snap &> /dev/null; then
  echo "[+] Installing snapd..."
  sudo apt install -y snapd
else
  echo "[✔] snapd is already installed."
fi

### 3. Install Snap applications
SNAP_APPS=("slack" "discord" "zoom-client")
for app in "${SNAP_APPS[@]}"; do
  if snap list | grep -q "^$app"; then
    echo "[✔] $app is already installed (snap)."
  else
    echo "[+] Installing $app via snap..."
    if [ "$app" = "slack" ]; then
      sudo snap install "$app" --classic
    else
      sudo snap install "$app"
    fi
  fi
done

### 4. Install TeamViewer from .deb if not installed
if ! command -v teamviewer &> /dev/null; then
  echo "[+] Installing TeamViewer..."
  wget -O /tmp/teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  sudo apt install -y /tmp/teamviewer.deb
  rm -f /tmp/teamviewer.deb
else
  echo "[✔] TeamViewer is already installed."
fi

echo "✅ All utility applications have been successfully installed."
