#!/bin/bash

export WINEPREFIX="/home/ice/GAME/hoyogames/genshin_aagl/"
export WINE="/home/ice/git/Hoyo_games_desktopfiles/scripts/spritz-wine-tkg-staging-wow64/bin/wine"
export GAME_EXECUTABLE="/home/ice/GAME/miHoYo Launcher/games/Genshin Impact Game/YuanShen.exe"
# genshin_loader：用以解决闪退问题，来源及用法：https://github.com/everything411/fpsunlock?tab=readme-ov-file#cn-server-workaround-unlocker_cn
export LOADER="/home/ice/git/Hoyo_games_desktopfiles/scripts/fpsunlock/genshin_loader"
# 伪装steam启动：6.2版本后，断网/hosts方式虽然能启动游戏，却会遭遇无限弹窗问题，疑似是因为通过不合规的方式绕过了游戏启动时的反作弊检测，从而触发了在线检测，从而触发弹窗。而通过steam方式可以正常启动原神。spritz-wine内置此功能。
export WINE_ENABLE_STEAM_STUB=1

"$LOADER" 90 "$WINE" "$GAME_EXECUTABLE" &
