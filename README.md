Personal home vim config

安装的plugin列表
1.pathogen. 插件管理
2.conqueterm. run interactive program in vim buffer
3.a.vim
4.lua-support
5.bash-support
6.c/c++-support


文件树架构
1.首先vim执行plugin 中的所有脚本，主要是定义一些全局变量，和函数。
2.在到ftplugin中执行匹配文件类型的脚本，
3.在indent/中设置相关的缩进
4.执行.vimrc

1 read 
2 autocmd 自动命令
3 source 读取一个文件中的Ex命令
4 autocmd-events 

" set cmd
set
setlocal setl

"specal words 
<BS> 删除光标前的字符
<Del> 删除光标后的字符

"自动补全
words
set complete+=k           " scan the files given with the 'dictionary' option
C-P: previous-match 
C-N: next-match 
C-X C-F match in file-name

complet 定制补全策略

