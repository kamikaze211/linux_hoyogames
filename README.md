# 关于
在archlinux上，脱离steam客户端使用umu-launcher与proton兼容层（如proton-ge-custom），来创建prefix，安装、更新和运行米家游戏的pc客户端和游戏，附带实用注册表文件与运行游戏脚本文件等



# 常见问题：

1、为什么不用wine?

A：因为直接使用wine会出现一些问题，比如全屏不能获取焦点、手柄支持有问题、游戏内浏览器卡死等。其中一些可以通过简单的更改注册表或设置来解决，另一些则比较复杂，难以解决。

2、为什么不用steam？

A：运行steam会占用一些资源和启动时间。

3、为什么不用第三方启动器？

A：大多数第三方启动器都只支持windows平台，因为它们中的许多都用到了windows独占的api。

4、AAGL之类的怎么样？

A：AAGL很好，但仍需要用户有一些灵活变通的能力，才能更好地使用。当然最主要的问题是，对于中国大陆用户而言，大概率需要翻墙才能用。其次就是每次预下载/更新时，都需要等待上游支持。



# 提供了一些示例脚本，在scripts/下，可以自行修改以方便地管理和运行游戏（包含中国大陆服和国际服的原神、星穹铁道、绝区零三款游戏，以及反反作弊的一些技巧）
# 也提供了快进方式，在desktopfiles/下；图标文件，在icons/下；以及一些常用注册表文件，在reg/下



# 当脱离steam客户端使用由proton-ge-custom创建的wineprefix时，可能需要手动安装dxvk

安装proton-ge-custom-bin（fsync）、dxvk-bin、umu-launcher（一个脱离steam使用proton兼容层的工具，）
```
paru -S proton-ge-custom-bin dxvk-bin
```

可选proton-xiv-bin（proton-ge-customd的ntsync版，需要内核高于6.14，且挂载ntsync模组）
```
mkdir /etc/modules-load.d/
touch /etc/modules-load.d/ntsync.conf
echo "ntsync" > /etc/modules-load.d/ntsync.conf
```

通过proton-ge-custom创建wineprefix（proton-xiv类似，不再赘述）
```
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64  regedit
```

可选：更改wineprefix的dpi以适应hidpi显示器，在显示选项栏中调整dpi即可，比如从96调整至144
```
WINEPREFIX=/home/ice/GAME/hoyogames/ /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine64  winecfg
```

安装dxvk至wineprefix中
```
WINEPREFIX=/home/ice/GAME/hoyogames/ setup_dxvk install
```
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
当然你也可以安装至其他位置（比如/home/ice/GAME/）便于管理
注意：使用wine运行米哈游启动器，可能出现窗口顶部按钮不可见的问题，可以通过【winecfg>显示>取消“允许窗口管理器装饰窗口”的对话框】以解决


# 关于反作弊（国际服暂时不需要这些技巧）
目前原神国服反作弊比较严格，除了必须断网启动游戏来绕过，还需要绕过游戏中实时检测（不通过则无限弹窗，无法正常游玩），但在linux上似乎有白名单机制，关于这点我不想详细说明（以免被滥用，但脚本中已经进行了相关处理）；星穹铁道需要第三方反反作弊项目来绕过检测；绝区零则可以通过屏蔽域名（或者断网启动）来绕过。



# 按需修改/etc/hosts
```
# 中国大陆服需屏蔽以下域名以在linux上运行，否则运行即报错
#0.0.0.0 dispatchcnglobal.yuanshen.com （注意，在更新至5.2版本后，不再需要且不应再将此域名屏蔽，否则会无限提示4201报错，此处保留仅作存档！目前仅可通过启动游戏前断网来绕过）
0.0.0.0 globaldp-prod-cn01.juequling.com （断网和屏蔽域名方式选择其中一项即可，都选也可以）

#中国大陆服与国际服可选屏蔽域名，减少用户数据被分析的可能
0.0.0.0 osuspider.yuanshen.com
0.0.0.0 overseauspider.yuanshen.com
0.0.0.0 uspider.yuanshen.com
0.0.0.0 ys-log-upload.mihoyo.com
0.0.0.0 ys-log-upload-os.hoyoverse.com
```



### 最后，祝你游戏愉快！
