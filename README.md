# 关于本文
本文旨在展示如何在linux上以proton-ge-custom ( https://github.com/GloriousEggroll/proton-ge-custom ) 启动米哈游旗下的游戏，而无需借助Steam或Lutris或AAGL等工具，只依靠系统上安装的的wine或proton-ge-custom来对游戏进行管理（安装/卸载/更新）和游玩；此外还收集了一些在linux平台游玩米家游戏时的常见问题与其解决方案

# 为何要这样？
启动额外的工具，会额外占用一些资源（硬件加速会占用显存、应用本身会占用高内存），而且也会多一些操作，直接一个desktop文件一键启动岂不美哉？

# 为什么不用第三方启动器？
大多数第三方启动器都无法通过wine打开，因为它们使用了WIN UI

# AAGL怎么样？nmcli n off ; MANGOHUD=1 DXVK_FILTER_DEVICE_NAME=AMD https_proxy= http_proxy= %command% -platform_type CLOUD_THIRD_PARTY_PC -is_cloud 1 & sleep 10 ; nmcli n on
当然这是一个很好的工具，它非常便于使用，且集成了不少功能。但值得一提的是，越是面向初级者的工具，越是难以面面俱到。比如当游戏更新时，你必须等待这些工具的制作组去更新启动器后才能进行游玩，而通常预下载功能也很难被照顾到。因此如果你是个急急国王，我推荐你使用官方的启动器来对游戏资源进行管理。

### 以下是我如何在我的电脑上管理米哈游的游戏的

# 首先在你的发行版上安装wine及一些必要组件
```
pacman -S wine wine-gecko wine-mono
```

# 至少运行一次wine，确认它创建了wine前缀
```
winecfg
```
我强烈建议安装并使用proton-ge-custom运行游戏，这可以省去你为系统wine前缀安装dxvk等一系列补丁的工夫
```
paru -S proton-ge-custom-bin
```
注意：你可任意使用第三方仓库（比如archlinuxcn、chaotic-aur等）中的预编译版本，来节省时间

# 从官网下载启动器并安装
中国大陆服： https://launcher.mihoyo.com/ ； 国际服： https://hoyoplay.hoyoverse.com/

以你喜欢的方式运行启动器安装文件，如果你有dolphin之类的文件管理器，你可以直接右键选择Wine Windows Program Loader运行，当然你也可以通过命令行运行
```
wine 'path/to/launcher.exe'
```
在安装时，可以使用默认路径
启动器的默认路径是：
```
~/.wine/drive_c/Program Files/miHoYo Launcher/
```
然后，你可以安装你喜欢的游戏
游戏的默认路径是：
```
~/.wine/drive_c/Program Files/miHoYo Launcher/games/
```

# 使用proton-ge-custom代替wine来启动游戏
```
WINEPREFIX=/home/ice/.wine /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine 'path/to/game.exe'
```
你也可以搭配一些其他工具使游戏运行得更加符合你的预期
```
WINEPREFIX=/home/ice/.wine MANGOHUD=1 ENABLE_VKBASALT=1 DXVK_FILTER_DEVICE_NAME=AMD https_proxy= http_proxy= /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine ~/git/jadeite/ys_unlock.bat
```
下面是命令/参数的一些解释

MANGOHUD=1 (https://github.com/flightlessmango/MangoHud)

ENABLE_VKBASALT=1 (https://github.com/DadSchoorse/vkBasalt)

DXVK_FILTER_DEVICE_NAME= (https://github.com/doitsujin/dxvk?tab=readme-ov-file#device-filter)

https_proxy= http_proxy= ( 使用代理可能会使游戏阻止你登录，因此需要关闭代理，但合理配置代理规则就可以避免这样)

/usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine (使用proton-ge-custom的wine程序代替系统的wine程序来运行游戏)

~/git/jadeite/ys_unlock.bat (自定义bat脚本，以实现运行游戏后自动运行帧数解锁补丁：https://codeberg.org/mkrsym1/fpsunlock/releases)

```
Z:
cd "Z:\home\ice\GAME\Genshin Impact\Genshin Impact Game\"
start YuanShen.exe %*
cd "Z:\home\ice\git\jadeite\"
start fpsunlock.exe 120 500
```
当你确认能通过命令行以你满意的方式运行游戏后，你可以创建一个desktop文件（例如原神.desktop），如此你就可以一键启动原神（以及其他游戏啦）
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

# 按需更改/etc/hosts
```
# 中国大陆服需屏蔽以下域名以在linux上运行，否则运行即报错
0.0.0.0 dispatchcnglobal.yuanshen.com
0.0.0.0 globaldp-prod-cn01.juequling.com

#中国大陆服与国际服可选屏蔽域名，减少用户数据被分析的可能
0.0.0.0 osuspider.yuanshen.com
0.0.0.0 overseauspider.yuanshen.com
0.0.0.0 uspider.yuanshen.com
0.0.0.0 ys-log-upload.mihoyo.com
0.0.0.0 ys-log-upload-os.hoyoverse.com
```

# xxxxx-4001弹窗问题的解决方案
中国大陆服游玩原神时，可能会出现xxxxx-4001弹窗，一般重新进入大世界即可解决，但严重情况下可能会一直重复弹窗，可通过进入大世界后断网/暂停游戏进程解决。下面是一个自动化脚本实例，可将脚本文件绑定至快捷键，以快速暂停游戏进程并在一定时间后恢复
```
#!/bin/bash
kill -STOP $(pgrep YuanShen.exe)
#可自定义暂停游戏进程的时间，如果执行了依然弹窗可以尝试调高
sleep 90
kill -CONT $(pgrep YuanShen.exe)
```
但更推荐添加云游戏参数以绕开检测
```
# ys_unlock.bat后的-platform_type CLOUD_THIRD_PARTY_PC -is_cloud 1即为云游戏参数
WINEPREFIX=/home/ice/.wine /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine /home/ice/git/jadeite/ys_unlock.bat -platform_type CLOUD_THIRD_PARTY_PC -is_cloud 1
```

# 米家游戏载入时花费时间过长，CPU占用率高导致部分场景帧数低、卡顿
这两个问题似乎有一些相关性，前者可通过winecfg，在显示设置中打开虚拟桌面以解决；后者可以在启动游戏时断网，然后等待数秒钟再联网，这也许有助于跳过某些奇怪的联网检查脚本，从而降低cpu使用率
```
nmcli n off ; 游戏命令参数 & sleep 10 ; nmcli n on
```
需要安装nmcli，这条命令的意思是，关闭网络，运行游戏，十秒钟后，打开网络

### 最后，我也放了一些desktop文件的示例与各种logo文件，希望你游戏愉快





-------------------------------------------------ENGLISH VERSION-------------------------------------------------

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

### I also uploaded the icons and desktop files, you can edit them as you need.
