Z:

regedit /s "Z:\home\ice\git\Hoyo_games_desktopfiles\reg\genshin_hdr.reg"

reg add HKLM\System\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d STEAMDECK /f

reg add HKLM\System\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d STEAMDECK /f

cd "Z:\home\ice\GAME\miHoYo Launcher\games\Genshin Impact Game\"

start YuanShen.exe

cd "Z:\home\ice\git\Hoyo_games_desktopfiles\scripts\"

start fpsunlock.exe 180 1000
