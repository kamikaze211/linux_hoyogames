#!/bin/bash

# make mangohud can show the cpu power
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

# define the environments
# the prefix path
PREFIX="/home/ice/GAME/hoyogames/genshin_global/"
# the proton path
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
# the game GAME_EXECUTABLE path
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/genshin_unlock_global.bat"

# disconnect the network
nmcli n off &

# define the environments and run the game
WINEPREFIX="$PREFIX" \
GAMEID="umu-genshin" \
PROTONPATH="$PROTON" \
umu-run "$GAME_EXECUTABLE" &

# sleep for 2 second
sleep 5

# 恢复网络；reconnect the network
nmcli n on
