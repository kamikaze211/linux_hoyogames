#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量
PREFIX="/home/ice/GAME/hoyogames/zzz/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
# 游戏执行文件路径
GAME_EXECUTABLE="/home/ice/GAME/miHoYo Launcher/games/ZenlessZoneZero Game/ZenlessZoneZero.exe"

# 查找并结束所有名字包含“.exe”的进程
wineserver -k
pkill -f "\.exe"

# 设置环境变量并运行游戏（需要在/etc/hosts中加入0.0.0.0 globaldp-prod-cn01.juequling.com）
PROTON_USE_NTSYNC=1 \
ENABLE_LSFG=1 \
LSFG_MULTIPLIER=2 \
LSFG_FLOW_SCALE=1 \
LSFG_PERF_MODE=1 \
DXVK_HUD=fps \
MANGOHUD=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" &
