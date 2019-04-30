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

 
