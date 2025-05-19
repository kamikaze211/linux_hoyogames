#!/bin/bash

#需要安装umu-launcher（multilib有）

#开启mangohud的cpu功耗检测
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量
#使用的PREFIX
PREFIX="/home/ice/GAME/hoyogames/hsr_global/"
#使用的兼容层位置
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
#反反作弊文件路径
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/jadeite.exe"
# 游戏执行文件路径（windows路径，可以通过winepath -w '/path/to/exe/linux'转换）
GAME_PATH="Z:\home\ice\GAME\HoYoPlay\games\Star Rail Games\StarRail.exe"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

#登录账号可能需要设置代理；国际服不要设置空代理，会登录不上账号
#https_proxy=http://127.0.0.1:9998 \
#http_proxy=http://127.0.0.1:9998 \

# 设置环境变量并运行游戏
#DXVK_FRAME_RATE=120 \
https_proxy=http://127.0.0.1:9998 \
http_proxy=http://127.0.0.1:9998 \
MANGOHUD=1 \
ENABLE_VKBASALT=1 \
WINEPREFIX="$PREFIX" \
GAMEID="umu-hsr" \
PROTONPATH="$PROTON" \
taskset -c 0-11 gamemoderun umu-run "$GAME_EXECUTABLE" "$GAME_PATH" &
