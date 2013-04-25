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


" for Powerline
set laststatus=2   " Always show the statusline

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



"Basically you press * or # to search for the current selection !! Really useful
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
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
let NERDTreeIgnore=['\~$','\.out','\.o','\.d']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" T-command 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTMaxFiles=30000
let g:CommandTMaxDepth=6
let g:CommandTMaxCachedDirectories=3


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline sets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在termianl下显示颜色
let g:Powerline_symbols='fancy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1

""""""""""""""""""""

""""""""""""""""""""
" vim completion set
""""""""""""""""""""
"set omnifunc
"关掉智能补全时的预览窗口
"set completeopt=longest, menu
"

"let g:acp_enableAtStartup 
imap <Tab> <C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MXL plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:xml_use_xhtml = 1

" vim plugens set end }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some keyboard bind
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :nohlsearch<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"buffer set
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Change buffer - without saving
set hid

cmap bb :b#<CR>
"set hidden

"mvoe to windows
nmap wh <C-w>h
nmap wj <C-w>j
nmap wk <C-w>k
nmap wl <C-w>l

"Ex history cmd
cmap ff <Up>
cmap jj <C-n>
cmap kk <C-p>

"for esaymont
nmap f  \\f
nmap F  \\F

nmap \s :Ack <C-R><C-F><CR>

"Emacs mont key in insert mode" 
"imap <C-a> <Esc>I
"imap <C-e> <Esc>A

"" Linux kernel 模式 ---------------------------
function s:KernelMode()
  " set path "
  let l:kernel_releaseLF = system('uname -r')
  " delete LF char
  let l:kernel_release = strpart(l:kernel_releaseLF, 0, strlen(l:kernel_releaseLF) -1)
  let l:headers = ",/usr/src/linux-headers-" . l:kernel_release . "/include"
  echo l:headers
  let &path = &path . l:headers

  " set indent"
  setl cindent
	setlocal tabstop=8
  setlocal shiftwidth=8
  setlocal textwidth=80
  setlocal noexpandtab
  setlocal formatoptions=tcqlron
  setlocal cinoptions=:0,l1,t0,g0

  " highlight"
  syn keyword cOperator likely unlikely
  syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
  highlight default link LinuxError ErrorMsg

  match	LinuxError " \+\t"	" spaces before tab
  match	LinuxError "\s\+$"	" trailing whitespaces
  match	LinuxError /\%81v.\+/	" virtual column 81 and more
endfunction

command LinuxKernelMode call s:KernelMode()
"""""""""""""""""""""""""""

nmap  tg :!ctags -R<CR>

set tags+=~/xpoker/tags/luaTags,../tags
set path+=~/xpoker

""""""""""""""""""""

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
  cmap RC :e ~/.vimrc<CR>

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

  "Remove indenting on empty lines
  "map <F2> :%s/\s*$//g<cr>:noh<cr>''

  "Super paste
  "inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

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


