#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

PREFIX="/home/ice/GAME/hoyogames/hsr_global/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/"
GAME_EXECUTABLE="/home/ice/git/Hoyo_games_desktopfiles/scripts/jadeite.exe"
GAME_PATH="Z:\home\ice\GAME\HoYoPlay\games\Star Rail Games\StarRail.exe"

WINEPREFIX="$PREFIX" \
GAMEID="umu-hsr" \
PROTONPATH="$PROTON" \
umu-run "$GAME_EXECUTABLE" "$GAME_PATH" &
