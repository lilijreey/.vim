"===============================================================================
"==========  CUSTOMIZATION (vimrc)  ============================================
"===============================================================================
" modify by lili Thu Jul  5 10:51:23 CST 2012
"-------------------------------------------------------------------------------
" Enable the use of the mouse for certain terminals.
"-------------------------------------------------------------------------------
if &term =~ "xterm"
  set mouse=a
endif
"
"-------------------------------------------------------------------------------
" Use of dictionaries
"-------------------------------------------------------------------------------
set complete+=k           " scan the files given with the 'dictionary' option
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
setl autochdir             " change the current working directory
setl autoread              " read open files again when changed outside Vim
setl autowrite             " write a modified buffer on each :next , ...
"setl browsedir  =current   " which directory to use for the file browser
setl incsearch             " use incremental search
setl nowrap                " do not wrap lines
setl visualbell            " visual bell instead of beeping
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P
vnoremap [ s[]<Esc>P
vnoremap { s{}<Esc>P
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
 map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
"
"-------------------------------------------------------------------------------
" Filename completion
" 
"   wildmenu : command-line completion operates in an enhanced mode
" wildignore : A file that matches with one of these
"              patterns is ignored when completing file or directory names.
"-------------------------------------------------------------------------------
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
"
"-------------------------------------------------------------------------------
" print options  (pc = percentage of the media size)
"-------------------------------------------------------------------------------
set printoptions=left:8pc,right:3pc

"-------------------------------------------------------------------------------
" lua-support.vim
"-------------------------------------------------------------------------------
let g:Lua_AuthorName  = 'William'
let g:Lua_AuthorRef   = 'Wi'
let g:Lua_Email       = 'lilijreey@gmail.com'

