#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量
PREFIX="/home/ice/GAME/hoyogames/hsr/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/jadeite.exe"
GAME_PATH="Z:\\home\\ice\\GAME\\miHoYo Launcher\\games\\Star Rail\\StarRail.exe"
GAME_PATH_LINUX="/home/ice/GAME/miHoYo Launcher/games/Star Rail/StarRail.exe"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

# 关闭网络；disconnect the network
#nmcli n off &

# 设置环境变量并运行游戏（不断网的话需要在/etc/hosts中加入0.0.0.0 globaldp-prod-cn01.bhsr.com）
DXVK_HUD=fps \
MANGOHUD=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" "$GAME_PATH" &


# 暂停一秒；sleep for 10 second
#sleep 10

# 恢复网络；reconnect the network
#nmcli n on
