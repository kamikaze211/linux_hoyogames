#!/bin/bash

#使mangohud可以检测CPU的功耗；make mangohud can show the cpu power
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj
#sudo cp -f /home/ice/git/Hoyo_games_desktopfiles/scripts/hosts_dispatch.txt /etc/hosts

# 配置常量；define the environments
PREFIX="/home/ice/GAME/hoyogames/genshin/"
#PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
#PROTON="/home/ice/.steam/steam/compatibilitytools.d/XIV-Proton9-27-ntsync/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
# 游戏执行文件路径；the game GAME_EXECUTABLE path
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/ys_unlock.bat"
#GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/unlockfps_nc_signed.exe"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

# 关闭网络；disconnect the network
nmcli n off &

# 设置环境变量并运行游戏；define the environments and run the game
DXVK_FRAME_RATE=144 \
DXVK_HDR=1 \
PROTON_ENABLE_WAYLAND=1 \
PROTON_ENABLE_HDR=1 \
MANGOHUD=1 \
ENABLE_VKBASALT=1 \
https_proxy= \
http_proxy= \
WINEPREFIX="$PREFIX" \
GAMEID="umu-genshin" \
PROTONPATH="$PROTON" \
SteamDeck=1 \
taskset -c 0-11 gamemoderun umu-run "$GAME_EXECUTABLE" &

# 暂停一秒；sleep for 2 second
sleep 1

# 恢复网络；reconnect the network
nmcli n on
