"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is based on the vimrc by Amix - http://amix.dk/
" You can find the latest version on:
"       http://iamjesus.blogcn.com
"
" Maintainer:lilijreey <lilijreey@126.com>
" Version: 0.1
" Last Change: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"open file plugin
filetype plugin indent  on

" highlight
syntax on "sync fromstart


"Sets how many lines of history VIM har to remember
set history=40



"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=nv

"Wrap lines "不要折行
set nowrap

" delete ^M
" :%s/\r//g
""""""""""""""""""""""""""""""
" vim plugens set begin
"""""""""""""""""""""""""""""" {{{
"pathogen 
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized-color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized 在终端下现实的不太好
if has('gui_running') 
  set go="not show enum tools list
  set background=dark
  let g:solarized_menu=0
  colorscheme solarized 
else
  "let g:solarized_termcolors=&t_Co
  "let g:solarized_termtrans=1
  "colorscheme distinguished 
  colorscheme torte 
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
"set whichwrap+=<,>,h,l
set whichwrap+=<,>

"Ignore case when searching
set ignorecase smartcase

"Include search
set incsearch

"Highlight search things
set hlsearch

"Set magic on
set magic

"No sound on errors.
"set noerrorbells
"set novisualbell
"set t_vb=

set autowrite
set nowrapscan

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup 
"set backupdir "where save the backup files
"set noswapfile
"
"首先尝试最长的
set wildmode=longest:full,full

"Basically you press * or # to search for the current selection !! Really useful
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Restore cursor to file position in previous editing session
set viminfo='20,\"100,:20,n~/.viminfo
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

"set dictionary C-X C-K compliac
"set dictionary+=/usr/lib/firefox/dictionaries/en_US.dic
set complete+=k


"Fast Ex command
noremap ; :

"For mark move
"nnoremap <leader>' '

"Fast copy
"nnoremap ' "

"屏蔽一些文件
set wildignore+=*.o,*.obj,*.d
"
"call pathogen#helptags()
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree sets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不显示的文件类型
let NERDTreeIgnore=['\~$','\.out','\.o','\.d','\.beam']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" T-command 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTMaxFiles=30000
let g:CommandTMaxDepth=6
let g:CommandTMaxCachedDirectories=3
let g:CommandTCancelMap=['<Esc>', '<C-c>']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline sets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在termianl下显示颜色
" for Powerline
set laststatus=2   " Always show the statusline
let g:Powerline_symbols='fancy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_mode_map = { 'mode': 'passive',
                           "\ 'active_filetypes': ['ruby', 'php', 'sh', 'bash'],
                           "\ 'passive_filetypes': ['puppet'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_confirm_extra_conf = 1
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

""""""""""""""""""""
" vim completion set
""""""""""""""""""""
"set omnifunc
"关掉智能补全时的预览窗口
"set completeopt=longest, menu
"

"let g:acp_enableAtStartup 
"imap <Tab> <C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MXL plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:xml_use_xhtml = 1

" vim plugens set end }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some keyboard bind
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F4> :nohlsearch<CR>
map <silent> <F5>  :NERDTreeToggle<CR>
map <silent> <F6> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"buffer set
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Change buffer - without saving
set hid

set splitbelow
set splitright
"set hidden

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
"nnoremap <C-j> <C-w>j
"nnoremap <C-h> <C-w>h
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" uppercase WORD TODO use func
inoremap <c-u> <esc>vawUea

cnoremap RC :e $MYVIMRC<cr>
"mvoe to windows
cnoremap bb :b#<CR>
"Ex history cmd
cnoremap ff <Up>
cnoremap jj <C-n>
cnoremap kk <C-p>

nnoremap <silent> tg :!ctags -R<CR>
"for esaymont
nmap f  \\f
nmap F  \\F

nnoremap \s :Ack <C-R><C-F><CR>


" 删除当前行的末尾字符
nnoremap \ed  :call setline('.', getline('.')[:-2])<CR>
inoremap \ed  <Esc>:call setline('.', getline('.')[:-2])<CR>a

" add char 当前行的末尾字符
nnoremap \ea :call setline('.', getline('.') . ';')<CR>
inoremap \ea  <Esc>:call setline('.', getline('.') . ';')<CR>a
"Emacs mont key in insert mode"oo
"imap <C-a> <Esc>I
"imap <C-e> <Esc>A

"%s/\(sds\)\([a-z]\)/\1_\2\gc
""""""""""""""""""""
" backup HOME/.vimrc to HOME/.vim/vimrc
function g:Bkvimrc()
  !cp $HOME/.vimrc $HOME/.vim/vimrc
endfunction

""""""""""""""""""""""""""""""""""""""""
"System depend
""""""""""""""""""""""""""""""""""""""""
if has("unix")
  " Chinese
  set fileencodings=utf-8,gb2312,gbk,gb18030
  set termencoding=utf-8
  set encoding=utf-8 

  " set path(for gf,find command)
  set path=./,../,/usr/include/,/usr/include/i386-linux-gnu/,/usr/local/include/,/

  " edit vimrc

  " set guifont
  set guifont=Ubuntu\ Mono\ 14
  """"""""""""""""""""""""""""""
  " termianl set
  """"""""""""""""""""""""""""""
  " Explicitly tell vim that the terminal supports 256 colors
  set t_Co=256 

  " read man page use vim
  let $PAGER=''
  source $VIMRUNTIME/ftplugin/man.vim

  "set 同义词补全
  "set thesaurus=/path/to/your/file

  
  "Remove the Windows ^M
  "noremap <Leader>dm mmHmn:%s/<C-V><cr>//ge<cr>'nzt'm

  "" Linux kernel 模式 ---------------------------
  function s:KernelMode()  " {{{
    " set path "
    "let l:kernel_releaseLF = system('uname -r')
    "" delete LF char
    "let l:kernel_release = strpart(l:kernel_releaseLF, 0, strlen(l:kernel_releaseLF) -1)
    "let l:headers = "/usr/src/linux-headers-" . l:kernel_release . "/include/"
    "echo l:headers
    " 参数必须是list 或字典类型"
    "let g:syntastic_c_include_dirs=["~/mm/lin/ll/include/"]
    "let &path = &path . "," . l:headers
    "let l:kernel_path="~/mm/lin/ll/"
    "setl path=~/mm/lin/ll/include/
    "setl tags=~/mm/lin/ll/tags
    " set indent"
    setl cindent
    setl tabstop=8
    setl shiftwidth=8
    setl textwidth=80
    setl noexpandtab
    setl formatoptions=tcqlron
    setl cinoptions=:0,l1,t0,g0

    " highlight"
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
    highlight default link LinuxError ErrorMsg

    match	LinuxError " \+\t"	" spaces before tab
    match	LinuxError "\s\+$"	" trailing whitespaces
    match	LinuxError /\%81v.\+/	" virtual column 81 and more
  endfunction

  command LinuxKernelMode call s:KernelMode() " }}}

  " Xpoker 模式 
  "function s:XpokerMode()
    "if !exists("s:xpokermode")
      "let s:xpokermode= 1
    "else
      "return
    "endif

    "set path+=~/xpoker,/~xpoker/Erl/ECommon

  "endfunction
  "au BufRead ~/mm/lin/ll/*      call s:KernelMode()
   
  " ZTS mode
  function s:ZTSMOde()
    setlocal path+=~/ggg/apps/*/include
    setl tags+=~/ggg/tags
  endfunction

  au BufRead ~/mm/lin/kernel/*  call s:KernelMode()
  au BufRead ~/ggg/*           call s:ZTSMOde()
  "command ErlPokerMode call s:ErlPoker()

endif

"""""""""""""""""""""""""""""""
"MS-windows set
"""""""""""""""""""""""""""""""
if has("win32")
  " Chinese
  set fileencodings=utf-8,gb2312,gbk,gb18030
  "set termencoding=utf-8 "deponed on Conslse charaecter set
  set encoding=utf-8     "encoding defalut is cp932, but Powerline need utf-8
endif

"vim: set foldmethod=marker
