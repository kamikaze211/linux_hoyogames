#!/bin/bash

#使mangohud可以检测CPU的功耗；make mangohud can show the cpu power
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# 配置常量；define the environments
PREFIX="/home/ice/GAME/hoyogames/genshin/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
# 游戏执行文件路径；the game GAME_EXECUTABLE path
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/ys_unlock.bat"
#GAME_EXECUTABLE="/home/ice/GAME/miHoYo Launcher/games/Genshin Impact Game/YuanShen.exe"

# 查找并结束所有名字包含“.exe”的进程（主要为了杀死一些残留的exe进程，防止在不同PREFIX中切换出现问题）
wineserver -k
pkill -f "\.exe"

# 关闭网络；disconnect the network
#nmcli n off &

# 添加需屏蔽服务器至hosts
sudo chmod 777 /etc/hosts
echo "0.0.0.0 dispatchcnglobal.yuanshen.com" >> /etc/hosts

# 设置环境变量并运行游戏；define the environments and run the game

#一些常用的可选环境变量
MANGOHUD=1 \
WINEPREFIX="$PREFIX" \
GAMEID="none" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" &

# 暂停一秒；sleep for 2 second
sleep 5

# 恢复网络；reconnect the network
#nmcli n on

# 修改hosts文件，保存至临时文件
sed '/0.0.0.0 dispatchcnglobal.yuanshen.com/d' /etc/hosts > /tmp/hosts_modified
# 用修改后的临时文件替换hosts
cp /tmp/hosts_modified /etc/hosts
