# Linux_hoyogames
This is a tutorial that show you how to install and play hoyogames on linux with proton-ge-custom(https://github.com/GloriousEggroll/proton-ge-custom) but without steam...

# Why without steam?
You can actually use steam to play non-steam games, but someones may not want to launch a game with a steam client on background.

# How is the 3rd party launchers?
Most of them are only for Windows, because they use the Windows UI, and it is not able to run those launchers through wine.

# How about the an anime game launcher?
Of course you can, this tool is very simple to use.

But if you want to play hoyogames at the first time when the games are updated, and don't want to wait the 3rd party launcher team to update their tools, then you can manage the launcher and games by yourself.

This is why I wrote this.

# Here is how I manage my launcher and games:

# Install wine on your linux distro, here is an example that on archlinux
```
pacman -S wine wine-gecko wine-mono
```

# Then run wine at least once, to make sure it created the prefix
```
winecfg
```
I strongly recommend you to install proton-ge-custom to run the games.
```
paru -S proton-ge-custom-bin
```
Notice: If you added some 3rd party repos, such as archlinuxcn or chaotic-aur, you can install the prebuilded packages, that can save your time.

# Run the hoyoplay launcher that downloaded from the official site
You can download the official launcher from: https://launcher.mihoyo.com/ for CN server players; https://hoyoplay.hoyoverse.com/ for Global server players.

Run the launcher with the way as you like, if you have file manager like dolphin, that you can just run the launcher with mouse click, and also you can run it in command line:
```
wine 'path/to/launcher.exe'
```
You can simply use the default path
For launcher default path is:
```
~/.wine/drive_c/Program Files/miHoYo Launcher/
```
Then you can install the game(s) that you want to play
For game default path is: 
```
~/.wine/drive_c/Program Files/miHoYo Launcher/games/
```

# launch the game with proton-ge-custom
```
WINEPREFIX=/home/ice/.wine /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine 'path/to/game.exe'
```
Also you can use other tools to make the game run better.
```
WINEPREFIX=/home/ice/.wine MANGOHUD=1 ENABLE_VKBASALT=1 DXVK_FILTER_DEVICE_NAME=AMD https_proxy= http_proxy= /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine ~/git/jadeite/ys_unlock.bat
```
MANGOHUD=1 (https://github.com/flightlessmango/MangoHud)

ENABLE_VKBASALT=1 (https://github.com/DadSchoorse/vkBasalt)

DXVK_FILTER_DEVICE_NAME= (https://github.com/doitsujin/dxvk?tab=readme-ov-file#device-filter)

https_proxy= http_proxy= (Proxy may make the game not able to login in CN server, so just disable the proxy. But may not work when using a TUN mode.)

/usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine (using proton-ge-custom wine instead of the system wine)

~/git/jadeite/ys_unlock.bat (my customized bat file, that can unlock fps in Genshin)

```
Z:
cd "Z:\home\ice\GAME\Genshin Impact\Genshin Impact Game\"
start YuanShen.exe %*
cd "Z:\home\ice\git\jadeite\"
start fpsunlock.exe 120 500
```
If you can enter the game through the command line, then you can create a desktop file (for example: Genshin.desktop), so next time you can enter the game just by mouse clicking:
```
[Desktop Entry]
Comment[zh_CN]=Genshin（proton-ge-custom）
Comment=Genshin（proton-ge-custom）
Exec=env WINEPREFIX=/home/ice/.wine MANGOHUD=1 ENABLE_VKBASALT=1 DXVK_FILTER_DEVICE_NAME=AMD https_proxy= http_proxy= /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine /home/ice/git/jadeite/ys_unlock.bat
GenericName[zh_CN]=Genshin（proton-ge-custom）
GenericName=Genshin（proton-ge-custom）
Icon='path/to/icon'
MimeType=
Name[zh_CN]=Genshin（proton-ge-custom）
Name=Genshin（proton-ge-custom）
Path=
StartupNotify=true
StartupWMClass=launcher.exe
Terminal=false
TerminalOptions=
Type=Application
X-KDE-SubstituteUID=false
X-KDE-Username=
```

# I also uploaded the icons and desktop files, you can edit them as you need.
