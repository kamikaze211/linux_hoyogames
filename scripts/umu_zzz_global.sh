#!/bin/bash

sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

PREFIX="/home/ice/GAME/hoyogames/zzz_global/"
PROTON="/usr/share/steam/compatibilitytools.d/proton-xiv/"
GAME_EXECUTABLE="/home/ice/GAME/HoYoPlay/games/ZenlessZoneZero Game/ZenlessZoneZero.exe"

WINEPREFIX="$PREFIX" \
GAMEID="umu-zzz" \
PROTONPATH="$PROTON" \
gamemoderun umu-run "$GAME_EXECUTABLE" &
