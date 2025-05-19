#!/bin/bash

# 使mangohud可以检测CPU的功耗；make mangohud can show the cpu power
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量；define the environments
# PREFIX路径； the prefix path
PREFIX="/home/ice/GAME/hoyogames/genshin_global/"
#兼容出路径； the proton path
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
# 游戏执行文件路径；the game GAME_EXECUTABLE path
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/genshin_unlock_global.bat"
#可选执行文件路径； optional executable pah
#GAME_EXECUTABLE_ALTER="/home/ice/git/Hoyo_games_desktopfiles/scripts/unlockfps_nc_signed.exe"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

# 关闭网络；disconnect the network
nmcli n off &

# 设置环境变量并运行游戏;define the environments and run the game
# fps limit of the game by setting DXVK_FRAME_RATE
DXVK_FRAME_RATE=144 \
DXVK_HDR=1 \
PROTON_ENABLE_WAYLAND=1 \
PROTON_ENABLE_HDR=1 \
MANGOHUD=1 \
ENABLE_VKBASALT=1 \
https_proxy=http://127.0.0.1:9998 \
http_proxy=http://127.0.0.1:9998 \
WINEPREFIX="$PREFIX" \
GAMEID="umu-genshin" \
PROTONPATH="$PROTON" \
SteamDeck=1 \
taskset -c 0-11 gamemoderun umu-run "$GAME_EXECUTABLE" &

# 暂停一秒；sleep for 2 second
sleep 1

# 恢复网络；reconnect the network
nmcli n on

#sudo cp -f /home/ice/git/Hoyo_games_desktopfiles/scripts/hosts_origin.txt /etc/hosts
