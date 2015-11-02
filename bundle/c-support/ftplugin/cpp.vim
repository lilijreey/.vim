" ------------------------------------------------------------------------------
"
" Vim filetype plugin file
"
"   Language :  C++
"     Plugin :  c.vim 
" Maintainer :  Fritz Mehner <mehner.fritz@fh-swf.de>
"   Revision :  $Id: customization.cpp.vim,v 1.1 2012/04/17 18:48:13 mehner Exp $
"
" ------------------------------------------------------------------------------
"
" Only do this when not done yet for this buffer
" 
if exists("b:did_CPP_ftplugin")
  finish
endif
let b:did_CPP_ftplugin = 1

"set competition

"if exists("g:CPP_Dictionary_File")
"    silent! exec 'setlocal dictionary+='.g:CPP_Dictionary_File
"endif    

set complete+=k

"add STL tags
setl path+=/usr/include/c++/4.9/

"-------------------------------------------------------------------------------
" additional mapping : C++ I/O
"-------------------------------------------------------------------------------
"
"inoremap	<buffer>	>> <Space>>><Space>
"inoremap	<buffer>	<< <Space><<<Space>
"inoremap	<buffer>	<<" <Space><< ""<Space><Left><Left>
"inoremap	<buffer>	<<; <Space><< "\n";<Left><Left><Left><Left>
"
