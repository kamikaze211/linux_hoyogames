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

# 设置环境变量并运行游戏
MANGOHUD=1 \
PROTON_USE_NTSYNC=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
ENABLE_VKBASALT=1 \
ENABLE_LSFG=1 \
LSFG_MULTIPLIER=2 \
LSFG_FLOW_SCALE=1 \
LSFG_PERF_MODE=1 \
gamemoderun umu-run "$GAME_EXECUTABLE" "$GAME_PATH" &
