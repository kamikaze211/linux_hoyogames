# 关于


在archlinux上，脱离steam客户端使用umu-launcher与proton兼容层（如proton-ge-custom），来创建prefix，安装、更新和运行米家游戏的pc客户端和游戏，附带实用注册表文件与运行游戏脚本文件等

# 常见问题：

1、为什么不用wine?

A：因为直接使用wine会出现一些问题，比如全屏不能获取焦点、手柄支持有问题、游戏内浏览器卡死等。其中一些可以通过简单的更改注册表或设置来解决，另一些则比较复杂，难以解决

2、为什么不用steam？

A：运行steam会占用一些资源和启动时间；通过steam启动米家游戏，可能触发反作弊检测从而被弹窗

3、为什么不用第三方启动器？

A：大多数第三方启动器都只支持windows平台，因为它们中的许多都用到了windows独占的api

4、AAGL之类的怎么样？

A：AAGL很好，但仍需要用户有一些灵活变通的能力，才能更好地使用。当然最主要的问题是，对于中国大陆用户而言，大概率需要翻墙才能用。其次就是每次预下载/更新时，都需要等待上游支持。另外，针对中国大陆服务器的特殊反作弊，可能这AAGL之类的启动器上不受支持


# 提供了一些示例脚本，在scripts下，可以自行修改以方便地管理和运行游戏（包含中国大陆服和国际服的原神、星穹铁道、绝区零三款游戏，以及关于反作弊的一些技巧，详见说明.txt）

# 也提供了一些其他资源，比如图标文件，在icons下；以及一些常用注册表文件，在reg下

# 当脱离steam客户端使用由proton-ge-custom创建的wineprefix时，可能需要手动安装dxvk

安装proton-ge-custom-bin、dxvk-bin、umu-launcher（一个脱离steam使用proton兼容层的工具）

```
**paru -S proton-ge-custom-bin dxvk-bin umu-launcher**
```
proton-ge-customd已支持ntsync，如需使用，请确认内核高于6.14，且挂载ntsync模组：

```
**mkdir /etc/modules-load.d/**
**touch /etc/modules-load.d/ntsync.conf**
**echo "ntsync" > /etc/modules-load.d/ntsync.conf**
```
通过proton-ge-custom创建wineprefix

```
**WINEPREFIX=/home/ice/GAME/hoyogames/xxx /usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin/wine  winecfg**
```
可选：更改wineprefix的dpi以适应hidpi显示器，在显示选项栏中调整dpi即可，比如从96调整至144

安装dxvk至wineprefix中

```
**WINEPREFIX=/home/ice/GAME/hoyogames/xxx setup_dxvk install**
```

# 鉴于米家游戏启动器可以直接通过wine安装和运行，为了更方便管理，直接使用系统的wineprefix进行游戏安装和更新

从官网下载启动器并安装 中国大陆服： <https://launcher.mihoyo.com/> ； 国际服： <https://hoyoplay.hoyoverse.com/>
以你喜欢的方式运行启动器安装文件，如果你有dolphin之类的文件管理器，你可以直接右键选择Wine Windows Program Loader运行，关于启动器的安装和使用，类似windows，不再赘述
注意：使用wine运行米哈游启动器，可能出现窗口顶部按钮不可见的问题，可以通过【winecfg>显示>取消“允许窗口管理器装饰窗口”的对话框】以解决

### 最后，祝你游戏愉快！

