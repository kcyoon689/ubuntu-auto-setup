# 🚀 Ubuntu Auto Installation Scripts

A complete set of installation scripts to set up a GPU-accelerated AI & robotics development environment on **Ubuntu 22.04**.
This includes NVIDIA drivers, CUDA, PyTorch, Docker, ROS 2, Miniconda, and essential development tools like Chrome, VSCode, and more.

## 📋 Supported System

- **OS**: Ubuntu 22.04 LTS (Jammy)
- **GPU**: NVIDIA (Tested on RTX 4090 with Driver v535+)
- **Shell**: Bash
- **Network**: Internet connection required

---

## 📦 Version Compatibility Summary

| Component     | Version                       |
|---------------|-------------------------------|
| OS            | Ubuntu 22.04                  |
| GPU Driver    | NVIDIA 535 / 555              |
| CUDA Toolkit  | 12.2 (driver-only install)    |
| PyTorch       | 2.2.2 (CUDA 12.1 pip build)   |
| Python        | 3.10 (via Miniconda)          |
| ROS2          | Humble (desktop full version) |

---

## 📦 Included Installation Scripts

| Category              | Script                                | Description                                        |
|-----------------------|---------------------------------------|----------------------------------------------------|
| GPU Driver / CUDA     | `nvidia-driver_install.sh`       | Install NVIDIA driver (v535)                       |
|                       | `cuda_install.sh`                | Install CUDA Toolkit 12.2                          |
|                       | `torch_install.sh`               | Install PyTorch with CUDA 12.1 support             |
| Docker                | `Docker_install.sh`              | Install Docker CE and Compose                      |
|                       | `nvidia_docker_toolkit_install.sh`    | NVIDIA Container Toolkit for GPU Docker            |
| Python Env            | `miniconda_install.sh`           | Install Miniconda + disable base env               |
| ROS2                  | `ROS2-humble_install.sh`         | Install ROS 2 Humble desktop version               |
| Development Tools     | `vscode_install.sh`              | Install Visual Studio Code                         |
|                       | `chrome_install.sh`              | Install Google Chrome                              |
|                       | `cursor_install.sh`                   | Install Cursor editor                              |
| Utilities             | `utils_install.sh`               | Install Snap + Slack, Discord, Zoom, TeamViewer    |

---

## ⚙️ How to Use

### 1. Clone this repository

```bash
git clone https://github.com/yourname/ubuntu-auto-installation.git
cd ubuntu-auto-installation
```

### 2. Make scripts executable

```bash
chmod +x *.sh
```

### 3. Run the master install script
```bash
./install_all.sh
```
You will be prompted for your sudo password once.
The scripts will execute in the recommended order automatically.


### Installation Order
1. NVIDIA Driver → CUDA → PyTorch
2. Docker + NVIDIA Container Toolkit
3. Miniconda
4. ROS 2 Humble
5. Chrome, VSCode, Cursor
6. Utility Tools (CLI + Snap-based)


### After Installation
To finalize the environment:

```bash
source ~/.bashrc
```

Then check:

```bash
nvidia-smi
conda --version
docker --version
ros2 --version
```

### ROS 2 Test Example
Open two terminals:

```bash
# Terminal 1
ros2 run demo_nodes_cpp talker
```

```bash
# Terminal 2
ros2 run demo_nodes_cpp listener
```

⚠️ If the listener does not respond, try setting the same domain ID:

```bash
export ROS_DOMAIN_ID=10
```


### Project Structure
```
ubuntu-auto-setup/
├── scripts/
│   ├── chrome_install.sh
│   ├── cuda_install.sh
│   ├── cursor_install.sh
│   ├── Docker_install.sh
│   ├── miniconda_install.sh
│   ├── nvidia-driver_install.sh
│   ├── nvidia_docker_toolkit_install.sh
│   ├── ROS2-humble_install.sh
│   ├── torch_install.sh
│   ├── utils_install.sh
│   ├── vscode_install.sh
├── install_all.sh
└── README.md
```


### 🙋 Contribution
PRs and issues are welcome!