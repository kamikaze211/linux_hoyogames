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

# 关闭网络；disconnect the network
#nmcli n off &

# 设置环境变量并运行游戏（不断网的话需要在/etc/hosts中加入0.0.0.0 globaldp-prod-cn01.juequling.com）
DXVK_HUD=fps \
MANGOHUD=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
game-performance umu-run "$GAME_EXECUTABLE" &


# 暂停一秒；sleep for 2 second
#sleep 5

# 恢复网络；reconnect the network
#nmcli n on
