# 中文问题
cygwin下locale设置为en_US.utf8，此locale下：
* cygwin自身带的命令输出的中文字符可以正确显示；
* windows下的命令输出的中文字符无法直接显示。
* conemu中，其启动菜单[设置环境变量](./img/set_task_locale.png)，将locale切换到GBK，能够正确显示windows下命令的中文字符，但此时cygwin下的命令的中文将无法正确显示。
* 可在执行的脚本中切换locale，还需进一步确认有效性。

```bat
set LANG=zh_CN.GBK & set CHERE_INVOKING=1 & set "PATH=%ConEmuBaseDirShort%\..\..\cygwin\bin;%ConEmuBaseDirShort%\..\..\cygwin\opt\bin;%ConEmuBaseDirShort%\..\..\usr\sbin;%PATH%" &  %ConEmuDir%\..\cygwin\bin\mintty.exe -e /opt/bin/service_start  -new_console:a
```

# windows下的UAC权限问题
某些命令需要管理员权限，conemu提供了一个便捷的手段获得该权限。
在配置task时，启动控制台参数中，增加[提升权限设置](./img/set_task_admin_right.png)。
```
-new_console:a

```
在非conemu的环境下如果希望获得管理员权限，可以参考install/中的adminrun.bat脚本

# ssh免密登陆
cygwin环境中自带ssh-copy-id脚本，将本地（默认）的id_rsa.pub文件拷贝到服务器/目标设备上。
首次执行这个脚本需要输入密码。

# 快捷菜单设置
每个快捷菜单都是一个task，有几个基本要素
* task名称，提供[一级下级菜单的能力](./img/submenu.png)
* 在配置界面中，用“::”隔开字符串形成[二级菜单](./img/submenucfg.png)
* “::”前一级菜单重复的task，其二级菜单在目录中将[合并显示](./img/submenuview.png)

# 安装问题
由于cygwin较为庞大，当前策略是缓存了一个本地目录，并根据实际需求定制了安装脚本。
安装脚本在maintain/install目录下，目前有效安装脚本mini.bat。
安装文件本地缓存未纳入git归档，相关目录内容如何维护有待进一步考虑。
