"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This vimrc is based on the vimrc by Amix - http://amix.dk/
" You can find the latest version on:
"       http://iamjesus.blogcn.com
"
" Maintainer:lilijreey <lilijreey@126.com>
" Version: 0.1
" Last Change: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"open file plugin
filetype plugin indent  on

" highlight
syntax enable
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
"set cmdheight=2

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

"set <Leader> default is \
"let mapleader="\\"
let mapleader="'"

"For mark move
"nnoremap <leader>' '

"Fast copy
"nnoremap ' "

"" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

nnoremap mm :make <CR>
nnoremap mc :make clean <CR>

nnoremap co :copen<CR>

"屏蔽一些文件
set wildignore+=*.o,*.obj,*.beam

"" multi_cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree sets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不显示的文件类型
"let NERDTreeIgnore=['\.out','\.o','.a','\.beam']

"""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""
" SQL file use postgreSQL styall
au BufNewFile, BufRead *.sql setf pgsql

"let g:ctrlp_map = '<c-p>'
"
nmap <Leader>b :CtrlPMRUFiles<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_working_path_mode = 'ra'


let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_depth = 7

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

let g:ctrlp_mruf_relative = 0

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
"let g:ctrlp_custom_ignore = {
      "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
      "\ 'file': '\v\.(exe|so|dll)$',
      "\ }



" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.svn'' --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''tags'' --hidden -g ""'
endif
"  open extension support tag search
let g:ctrlp_extensions = ['tag']


""lua
let g:lua_compiler_name='/usr/bin/luac'
let g:lua_check_globals = 0
let g:lua_check_syntax = 0
let g:lua_inspect_events = 'BufWritePost'

"在termianl下显示颜色
" for Powerline
set laststatus=2   " Always show the statusline
let g:Powerline_symbols='fancy'

"enable 
let g:doxygen_enhanced_color=1

"airline
let g:airline_powerline_fonts=1
"let g:airline_symbols = {}
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_enable_fugitive=1
"let g:airline_section_b='%{fugitive#statusline()}'
"let g:airline_section_c="%t"
"let g:airline_section_x="%y"
"let g:airline_section_y='BN: %{bufnr("%")}'

"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = 'L'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.whitespace = 'Ξ'

""""""""Eclim support by YCM
let g:EclimCompletionMethod = 'omnifunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag.vim ctrlsf use ag search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlsf_ackprg = 'ag'

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
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_autoclose_preview_window_after_insertion = 1
"this cmd will try all subcmmand
nnoremap <leader>jd :YcmCompleter GoTo<CR>

let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_filepath_completion_use_working_dir = 1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1

" 关闭lua 的ycm 和 lua 插件冲突
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'lua': 1
      \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"


"" protodef
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1


"Note
let g:notes_suffix = '.txt'

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
""easymotion
nmap f ''f
nmap F ''F
" vim plugens set end }}}
"

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
" uppercase WORD TODO use func
"inoremap <c-u> <esc>vawUea

"like Emacs Ctrl-A Ctrl-E in insert mode
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"inoremap <C-l> <S-Right>
"inoremap <C-h> <S-Left>
"inoremap <C-j> <C-g>j
"inoremap <C-k> <C-g>k

cnoremap RC :e $MYVIMRC<cr>
"mvoe to windows
cnoremap bb :b#<CR>
"Ex history cmd

nnoremap <silent> tg :!ctags -R<CR>
"for esaymont
"nmap f <leader>f
"nmap F <leader>F 

nnoremap <leader>s :Ag --ignore tags <C-R><C-F><CR>

nnoremap mk :make -j4 <CR>

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

" auto mkdir when dir not exist {{{
augroup auto_mkdir
  au!
  au BufWritePre,FileWritePre * call <SID>auto_mkdir()
augroup END

function <SID>auto_mkdir()
  " Get directory the file is supposed to be saved in
  let s:dir = expand("<afile>:p:h")

  " Create that directory (and its parents) if it doesn't exist yet
  if !isdirectory(s:dir)
    call mkdir(s:dir, "p")
  endif
endfunction
" }}}

""""""""""""""""""""""""""""""""""""""""
"System depend
""""""""""""""""""""""""""""""""""""""""
if has("unix")
  " Chinese
  set fileencodings=utf-8,gb2312,gbk,gb18030
  set termencoding=utf-8
  set encoding=utf-8 
  set guifont=Ubuntu\ for\ Powerline\ 14

  " set path(for gf,find command)
  set path=./,./include/,../,/usr/include/,/usr/include/i386-linux-gnu/,/usr/local/include/,/

  " edit vimrc

  " set guifont
  "set guifont=Source\ Code\ Pro\ for\ Powerline\ 13
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
  """"""""""""""""""""""""""""""
  " termianl set
  """"""""""""""""""""""""""""""
  " Explicitly tell vim that the terminal supports 256 colors
  set t_Co=256 

  " read man page use vim
  "let $PAGER=''
  source $VIMRUNTIME/ftplugin/man.vim
  nmap K :Man <C-R>=expand('<cword>')<CR><CR>

  nmap <space> @:<CR>
  "close down window "
  nmap wc :+quit<CR>


  " :Rename[!] {newname}
  command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

  function! Rename(name, bang)
    let l:name    = a:name
    let l:oldfile = expand('%:p')

    if bufexists(fnamemodify(l:name, ':p'))
      if (a:bang ==# '!')
        silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
      else
        echohl ErrorMsg
        echomsg 'A buffer with that name already exists (use ! to override).'
        echohl None
        return 0
      endif
    endif

    let l:status = 1

    let v:errmsg = ''
    silent! exe 'saveas' . a:bang . ' ' . l:name

    if v:errmsg =~# '^$\|^E329'
      let l:lastbufnr = bufnr('$')

      if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
        if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
          silent exe l:lastbufnr . 'bwipe!'
        else
          echohl ErrorMsg
          echomsg 'Could not wipe out the old buffer for some reason.'
          echohl None
          let l:status = 0
        endif

        if delete(l:oldfile) != 0
          echohl ErrorMsg
          echomsg 'Could not delete the old file: ' . l:oldfile
          echohl None
          let l:status = 0
        endif
      else
        echohl ErrorMsg
        echomsg 'Rename failed for some reason.'
        echohl None
        let l:status = 0
      endif
    else
      echoerr v:errmsg
      let l:status = 0
    endif

    return l:status
  endfunction

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


  function s:CocoLuaMode()
    if exists("b:cocoluamode")
      return
    endif

    let b:cocoluamode= 1
    set path+='~/work/shyx/'
  endfunction

  au BufRead ~/work/shyx/src/*      call s:CocoLuaMode()

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby setl tags+=~/.rvm/gems/ruby-2.2.3/gems/rubygems.tags

  " for rails
  function s:SubRails()
    if exists("b:sub_rails")
      return
    endif

    let b:sub_rails= 1
    "set tags+=/opt/src/rails/rails_src_421.tags
  endfunction

  au BufRead ~/src/rails-note/ra/* call s:SubRails()


  "au BufRead ~/mm/lin/kernel/*  call s:KernelMode()
  "command ErlPokerMode call s:ErlPoker()

  "for sdcv
  function! SearchWord()
    let expl=system('sdcv -n ' .
          \ expand("<cword>"))
    windo if
          \ expand("%")=="diCt-tmp" |
          \ q!|endif
    25vsp diCt-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
  endfunction

  nmap <C-k> :call SearchWord()<CR>

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

  "highlight LineNr ctermfg=239
  highlight LineNr ctermfg=239
  highlight Pmenu ctermbg=6
  highlight PmenuSel ctermbg=81
endif


"vim: set foldmethod=marker
