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
* windows下用mingw的git出现过获取下来的文件行尾出问题等奇怪情况（暂不明原因）
* 使用本工具的git repo，用以下步骤
  下载repo而不是clone
  进入到maintain/install，执行mini.bat，手动安装cygwin
  进入到cygwin，使用cygwin中自带的git，clone整个工程
  将安装好的cygwin移动到工程目录下即可。
* （可能）因为windows权限管理问题，git拉下来的文件权限被改变，建议在repo中忽略文件属性
```bash
	git config core.fileMode false	
```

# 开发问题
* 从git@10.90.5.34:qiyin2000网页上下载源码压缩包：
解压压缩包，并运行maintain/install中的mini.bat安装cygwin包（即windows下的unix环境）
* 或从//10.90.6.171/share/tmp下获得安装包直接安装，将自动安装mini.bat
将当前版本上的代码纳入git管理：
* 注意不要安装到中文路径下，会出错！！！
运行完成后会自启动界面，在界面中进入压缩文件的顶层目录；确保，能看到ConEmu/maintain文件夹；
```bash
            cd /cydrive/盘符/解压路径/nbudbg_master.
            git init
            git remote add origin git@10.90.5.34:qiyin2000/nbudbg.git
            git fetch origin master
            git reset --hard origin/master
```
* 建议自己生成id_rsa/pub对，贴到10.90.5.34上方便上传下载