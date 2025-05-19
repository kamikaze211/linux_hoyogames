#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量
#PREFIX="/home/ice/.steam/steam/steamapps/compatdata/2658835965/pfx/"
PREFIX="/home/ice/GAME/hoyogames/hsr/"
WINE="/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64"
#PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/jadeite.exe"
GAME_PATH="Z:\\home\\ice\\GAME\\miHoYo Launcher\\games\\Star Rail\\StarRail.exe"
GAME_PATH_LINUX="/home/ice/GAME/miHoYo Launcher/games/Star Rail/StarRail.exe"

# 查找并结束所有名字包含“.exe”的进程
#pkill -f "\.exe"

# 关闭网络
#nmcli n off

# 设置环境变量并运行游戏
#DXVK_FRAME_RATE=120 \
MANGOHUD=1 \
ENABLE_VKBASALT=1 \
https_proxy= \
http_proxy= \
WINEPREFIX="$PREFIX" \
GAMEID="umu-hsr" \
PROTONPATH="$PROTON" \
taskset -c 0-11 gamemoderun umu-run "$GAME_EXECUTABLE" "$GAME_PATH" &

# 暂停一秒
#sleep 1

# 恢复网络
#nmcli n on
