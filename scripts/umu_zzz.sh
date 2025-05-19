#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量
#PREFIX="/home/ice/.steam/steam/steamapps/compatdata/2562248805/pfx/"
PREFIX="/home/ice/GAME/hoyogames/zzz/"
#PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
# 游戏执行文件路径
GAME_EXECUTABLE="/home/ice/GAME/miHoYo Launcher/games/ZenlessZoneZero Game/ZenlessZoneZero.exe"

# 查找并结束所有名字包含“.exe”的进程
pkill -f "\.exe"

# 关闭网络
#nmcli n off &

# 设置环境变量并运行游戏
#DXVK_FRAME_RATE=144 \
MANGOHUD=1 \
ENABLE_VKBASALT=1 \
https_proxy= \
http_proxy= \
WINEPREFIX="$PREFIX" \
GAMEID="umu-zzz" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" &

# 暂停一秒
#sleep 2

# 恢复网络
#nmcli n on
