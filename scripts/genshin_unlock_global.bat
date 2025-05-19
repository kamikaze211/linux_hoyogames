Z:

regedit /s "Z:\home\ice\git\Hoyo_games_desktopfiles\reg\genshin_hdr_global.reg"

reg add HKLM\System\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d STEAMDECK /f

reg add HKLM\System\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d STEAMDECK /f

cd "Z:\home\ice\GAME\HoYoPlay\games\Genshin Impact game\"

start GenshinImpact.exe

cd "Z:\home\ice\git\Hoyo_games_desktopfiles\scripts\"

start fpsunlock.exe 360 1000
