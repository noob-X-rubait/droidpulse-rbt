#!/usr/bin/env bash
# ==============================================================================
# DroidPulse - Low-Level System & Kernel Parameter Optimizer
# Author: Rubait Islam (INTJ-T)
# Target: Linux Kernel / Android (AOSP) Environment
# ==============================================================================

clear
echo -e "\e[1;35m"
echo "    ____                 _     ____        _     "
echo "   |  _ \ _ __ ___   ___| |   |  _ \ _   _| |___  "
echo "   | | | | '__/ _ \ / _ \ |   | |_) | | | | / __| "
echo "   | |_| | | | (_) |  __/ |   |  __/| |_| | \__ \ "
echo "   |____/|_|  \___/ \___|_|___|_|    \__,_|_|___/ "
echo "                         |_____|                  "
echo -e "\e[0m"
echo -e "\e[1;32m[+]\e[0m Initializing DroidPulse Core Framework..."
sleep 1

# Check Kernel Architecture
ARCH=$(uname -m)
KERNEL_VER=$(uname -r)
echo -e "\e[1;34m[*]\e[0m Detected Architecture: \e[1;33m$ARCH\e[0m"
echo -e "\e[1;34m[*]\e[0m Active Kernel Version: \e[1;33m$KERNEL_VER\e[0m"
echo "------------------------------------------------"

# Interactive Virtual RAM Optimization Function
optimize_vm() {
    echo -e "\e[1;32m[+]\e[0m Tweaking Virtual Memory Swappiness..."
    # Micro-check for actual root privilege or simulation
    if [ "$EUID" -ne 0 ]; then
        echo -e "\e[1;31m[!]\e[0m Running in Simulation Mode (Non-Root/User Space)."
        echo -e "\e[1;30m[Sim]\e[0m sysctl -w vm.swappiness=10"
        echo -e "\e[1;30m[Sim]\e[0m sysctl -w vm.vfs_cache_pressure=50"
    else
        sysctl -w vm.swappiness=10 > /dev/null
        sysctl -w vm.vfs_cache_pressure=50 > /dev/null
        echo -e "\e[1;32m[+]\e[0m Kernel VM Tweaks Applied Successfully."
    fi
}

# Run optimization
optimize_vm

echo "------------------------------------------------"
echo -e "\e[1;32m[+]\e[0m System state generated. Executing Python Analyzer..."
python3 analyzer.py
