# nbugdb发布说明

## 功能简述
    nbudbg (Network Business Unit Debug Envirment)是基于cygwin发布版安装了开发过程可能需要使用到的一些基本工具，提供windows中类似于Linux操作系统的集成调试环境。
    当前集成了基础软件部提供的便捷工具，包括调试、诊断等相关功能。

## 使用方法
    执行自解压安装包，建议放于C或其他硬盘根目录下，全英文路径名。
    解压完成后会自动安装定制化后的cygwin运行环境，并在home目录下，按照windows的用户名，基于etc/skel下的模板创建用户，并打开本说明。
    进入调试环境后，可直接执行gdb等相关命令
    本环境包含的gdb支持所有架构处理器的交叉调试，直接读取任意架构的COREDUMP文件。

	本环境中已经安装了svn，git，并提供了提交svn记录时，符合网络产出线提交规范的“英文”模板。
	本环境中已安装了vim，并提供了一些基本的配置，能够正确读取中文，如F12可打开树状浏览。
* 注：中文目录使用可能会带来一些困扰，建议使用ln将中文路径转成英文路径使用。

## cygwin简介
    本环境包含的cygwin已安装一些基本工具，包括（但不限于）：
    vim、grep、sed、awk、jq、zip、unzip、python、svn、git。
    同时，可根据实际需要安装其他工具如tcl，便于集测等脚本的执行，执行apt-cyg可获得使用帮助。

## 其他信息
    本环境支持将中文路径通过ln命令，转义成英文目录：
	* 由于ln命令是cygwin特质化封装的，在cygwin环境中观察到是链接，但是在windows下观察到的是一个文件。
```bash
ln -sf 一个中文路径 to_eng_path
ls -lha 
total 1
lrwxrwxrwx  1 somebody somebody 6 Apr  2 15:37 to_eng_path -> 一个中文路径
drwxrwxrwx+ 1 somebody somebody 0 Apr  3 14:53 一个中文路径
cat to_eng_path/1 
123
cat 一个中文路径/1
123

```
 
