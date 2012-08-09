# Personal home vim config

### 生成帮助文件 call pathogen#helptags()

# 目录结构
> 1. bundle/ _插件的安装目录_
> 2. colors/ _使用的颜色配置_
> 3. ftplugin/ _对特定文件类型的一些设定_ 比如tags
> 4. indent/ _定义特定文件类型的缩进_
> 5. syntax/ _定义特定文件类型的语法加亮_

# 安装的plugin列表
> 1. pathogen. 插件管理
> 2. conqueterm. run interactive program in vim buffer
> 3. a.vim
> 4. lua-support
> 5. bash-support
> 6. c/c++-support
    个人修改:
    1. 个人修改的模版文件中的空格 bundle/c-support/c-support/templates/
    2. c/cpp 的字典文件在bundle/c-support/plugin/c.vim 中设置 `C_Dictionary_File CPP_Dictionary_File`的文件. 在ftplugin/中设置dictionary的值 

         
> 7. powerline
  配置，fancy 选项配置 在字体文件中注册powerline使用的symbol
>>  1. 找到当前使用的字体文件，ubuntu中在/usr/share/fonts中，
>>  2. 使用powerline/fontpatcher/中的工具，以一用的tty文件为参数
    生成新的tty文件(1.3 powerline)
>>  3. 把新生成的tty文件copy到~/.fonts目录中.
>>  4. 重启vim，享受把。
>
> 8. surround + repeat 添加符号给你个对象的周围
> 9. NERDtree
> 10. Tlist
> 11. Tabular 快速格式问本
> 12. command-T 关键字查找文件，由于vim是ruby1.8的借口，所以使用1.3版本
> 13. ack.vim use ack-grep in vim
> 14. vim-colors-solarized 一个颜色配置，
> 15. easymotion quick f


### 一些常用命令
sp [buffer] [file-name] 可以跟buffer or filename
vs [buffer] [file-name]

#### 
开启命令行编辑
cedit

### 开始文件的插件和缩紧
filetype plugin indent on

####切换window
C-w p swith in two buffers
C-w t
C-w b
ball

### 一下常用函数
has

exists

### 得到OS
使用feature-list


