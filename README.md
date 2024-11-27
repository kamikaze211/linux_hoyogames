# 本文主旨
在archlinux上，脱离steam客户端使用proton-ge-custom，来创建prefix，安装、更新和运行米家游戏的pc客户端和游戏。

# Q&A：
1、为什么不用wine？
A：因为直接使用wine会出现一些问题，比如全屏不能获取焦点、手柄支持有问题、游戏内浏览器卡死等。其中一些可以通过简单的更改注册表或设置来解决，另一些则比较复杂，难以解决。
2、为什么不用steam？
A：运行steam会占用不少资源和时间。
3、为什么不用第三方启动器？
A：大多数第三方启动器都只支持windows平台，因为它们中的许多都用到了windows独占的api。
4、AAGL之类的怎么样？
A：AAGL很好，但仍需要用户有一些灵活变通的能力，才能更好地使用。当然最主要的问题是，对于中国大陆用户而言，大概率需要翻墙才能用。

# 当脱离steam客户端使用由proton-ge-custom创建的wineprefix时，应该需要手动安装dxvk
安装proton-ge-custom-bin和dxvk-bin
paru -S proton-ge-custom-bin dxvk-bin
通过proton-ge-custom创建wineprefix
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64  regedit
可选：更改wineprefix的dpi以适应hidpi显示器，在显示选项栏中调整dpi即可
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64  winecfg
安装dxvk至wineprefix中
WINEPREFIX=/home/ice/GAME/hoyogames/ setup_dxvk install

注意：如果使用wine游玩，则有很大可能会遇到全屏wine程序切换窗口后无法获取焦点的问题
将下面代码复制保存为reg文件，并在wine regedit中导入可解决：
```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"UseTakeFocus"="N"
```

# 鉴于米家游戏启动器可以直接通过wine安装和运行，为了更方便管理，直接使用系统的wineprefix进行游戏安装和更新；也可以安装在前文提到的WINEPREFIX=/home/ice/GAME/hoyogames/中
从官网下载启动器并安装
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
当然你也可以安装至其他位置便于管理
注意：使用wine运行米哈游启动器，可能出现窗口顶部按钮不可见的问题，可以通过【winecfg>显示>取消“允许窗口管理器装饰窗口”的对话框】以解决

# 使用proton-ge-custom代替wine来启动游戏
```
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine 'path/to/game.exe'
```
你也可以搭配一些其他工具使游戏运行得更加符合你的预期
```
WINEPREFIX=/home/ice/GAME/hoyogames/ MANGOHUD=1 ENABLE_VKBASALT=1 DXVK_FILTER_DEVICE_NAME=AMD https_proxy= http_proxy= /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine 'path/to/game.exe'
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
当你确认能通过命令行以你满意的方式运行游戏后，你可以创建一个bash脚本或desktop文件，如此你就可以一键启动原神（以及其他游戏啦）
```
#!/bin/bash
#genshin impact
nmcli n off ; WINEPREFIX=/home/ice/GAME/hoyogames/ MANGOHUD=1 ENABLE_VKBASALT=1 https_proxy= http_proxy= /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64 ~/git/jadeite/ys_unlock.bat -platform_type CLOUD_THIRD_PARTY_PC -is_cloud 1 & sleep 1 ; nmcli n on
```

```
#!/bin/bash
#hsr
nmcli n off ; WINEPREFIX=/home/ice/GAME/hoyogames/ MANGOHUD=1 ENABLE_VKBASALT=1 DXVK_FILTER_DEVICE_NAME=AMD /usr/bin/gamemoderun /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64 /home/ice/git/jadeite/jadeite.exe 'Z:\home\ice\GAME\miHoYo Launcher\games\Star Rail\Game\StarRail.exe' & sleep 1 ; nmcli n on
```


# 按需更改/etc/hosts
```
# 中国大陆服需屏蔽以下域名以在linux上运行，否则运行即报错
#0.0.0.0 dispatchcnglobal.yuanshen.com （注意，在更新至5.2版本后，不再需要且不应再将此域名屏蔽，否则会无限提示4201报错，此处保留仅作存档！！！）
0.0.0.0 globaldp-prod-cn01.juequling.com

#中国大陆服与国际服可选屏蔽域名，减少用户数据被分析的可能
0.0.0.0 osuspider.yuanshen.com
0.0.0.0 overseauspider.yuanshen.com
0.0.0.0 uspider.yuanshen.com
0.0.0.0 ys-log-upload.mihoyo.com
0.0.0.0 ys-log-upload-os.hoyoverse.com
```

# xxxxx-4001弹窗问题的解决方案
中国大陆服游玩原神时，可能会出现xxxxx-4001弹窗，一般重新进入大世界即可解决，但严重情况下可能会一直重复弹窗，可通过进入大世界后断网/暂停游戏进程解决。
下面是一个自动化脚本实例，可将脚本文件绑定至快捷键，以快速暂停游戏进程并在一定时间后恢复（注意，此方法较为繁琐，且花时间，下面有更优方案，此方案仅在云游戏参数方案失效的情况下留作备用！！！）
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
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine /home/ice/git/jadeite/ys_unlock.bat -platform_type CLOUD_THIRD_PARTY_PC -is_cloud 1
```

# 米家游戏载入时花费时间过长，CPU占用率高导致部分场景帧数低、卡顿
这两个问题似乎有一些相关性，前者可通过winecfg，在显示设置中打开虚拟桌面以解决；后者可以在启动游戏时断网，然后等待数秒钟再联网，这也许有助于跳过某些奇怪的联网检查脚本，从而降低cpu使用率
```
nmcli n off ; 游戏命令参数 & sleep 1 ; nmcli n on
```
需要安装nmcli，这条命令的意思是，关闭网络，运行游戏，1秒钟后，恢复网络；同时这可以解决在进入游戏后卡加载的问题，并且此时如果切换窗口，则有极大可能引起游戏失去响应（这个现象在《崩坏：星穹铁道》中也能观察到）

### 最后，我会放入bash脚本、与各种logo文件，（desktop文件可通过手动创建，链接至脚本文件即可）。祝你游戏愉快！
