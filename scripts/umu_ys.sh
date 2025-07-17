#!/bin/bash

#使mangohud可以检测CPU的功耗；make mangohud can show the cpu power
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量；define the environments
PREFIX="/home/ice/GAME/hoyogames/genshin/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
# 游戏执行文件路径；the game GAME_EXECUTABLE path
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/ys_unlock.bat"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

# 关闭网络；disconnect the network
nmcli n off &

# 设置环境变量并运行游戏；define the environments and run the game

#一些常用的可选环境变量
#DXVK_FRAME_RATE=180 \  #通过DXVK来限制帧数
#taskset -c 0-11  #限制cpu核心数量，支持类似0~5,10~15这样的写法
#PROTON_USE_NTSYNC=1 \  #开启NTSYNC（体参照上游说明）
#PROTON_ENABLE_WAYLAND=1 \ #游戏启用WAYLAND
#PROTON_ENABLE_HDR=1 \ #游戏启用HDR，必须先启用WAYLAND
#ENABLE_VKBASALT=1 \  #通过VKBASALT来添加滤镜
#ENABLE_LSFG=1 \  #启用小黄鸭
#LSFG_MULTIPLIER=2 \  #启用小黄鸭插帧，设置倍数，默认为2
#LSFG_FLOW_SCALE=0.9 \  #小黄鸭插帧流缩放，数值越小帧数越高，但画面质量越低
#LSFG_HDR=1 \  #游戏开启HDR时，小黄鸭也需要开启HDR
#LSFG_PERF_MODE=1 \ #小黄鸭性能模式，应该是根据显示器刷新率上限自动设置参数，以适配目标帧数
PROTON_USE_NTSYNC=1 \
ENABLE_VKBASALT=1 \
ENABLE_LSFG=1 \
LSFG_MULTIPLIER=2 \
LSFG_FLOW_SCALE=1 \
LSFG_PERF_MODE=1 \
MANGOHUD=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" &

# 暂停一秒；sleep for 2 second
sleep 5

# 恢复网络；reconnect the network
nmcli n on
