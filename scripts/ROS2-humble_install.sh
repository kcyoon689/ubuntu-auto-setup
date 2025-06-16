#!/bin/bash
set -e

echo "[✔] Step 1: Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "[✔] Step 2: Installing required dependencies..."
sudo apt install -y software-properties-common

echo "[✔] Step 3: Enabling 'universe' repository and installing curl, gnupg, lsb-release..."
sudo add-apt-repository universe
sudo apt update && sudo apt install -y curl gnupg lsb-release

echo "[✔] Step 4: Installing ros-apt-source package..."

# Get latest release version
ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest \
  | grep -F "tag_name" | awk -F\" '{print $4}')

# Download and install .deb
curl -L -o /tmp/ros2-apt-source.deb \
"https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"

sudo apt install -y /tmp/ros2-apt-source.deb

echo "[✔] Step 5: Installing ROS 2 Humble (full desktop)..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y ros-humble-desktop ros-dev-tools

echo "[✔] Step 6: Setting up ROS environment variables..."
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source /opt/ros/humble/setup.bash

echo "[✔] Step 7: Installing additional development tools..."
sudo apt install -y python3-colcon-common-extensions python3-argcomplete

echo "[✔] Step 8: Verifying installation..."
ros2 --version

echo "[✔] ROS 2 Humble installation completed successfully!"
echo "[i] You can run 'ros2 run demo_nodes_cpp talker' in one terminal and 'ros2 run demo_nodes_cpp listener' in another to test."
