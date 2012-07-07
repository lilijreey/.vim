Personal home vim config

安装的plugin列表
1.pathogen. 插件管理
2.conqueterm. run interactive program in vim buffer
3.a.vim
4.lua-support
5.bash-support
6.c/c++-support
7.powerline
  配置，fancy 选项配置 在字体文件中注册powerline使用的symbol
  1.找到当前使用的字体文件，ubuntu中在/usr/share/fonts中，
  2.使用powerline/fontpatcher/中的工具，以一用的tty文件为参数
    生成新的tty文件(1.3 powerline)
  3.把新生成的tty文件copy到~/.fonts目录中.
  4.重启vim，享受把。

		
 
8.surround + repeat 添加符号给你个对象的周围
9.NERDtree
10.Tlist
11.Tabular 快速格式问本
12.command-T 关键字查找文件，由于vim是ruby1.8的借口，所以使用1.3版本



