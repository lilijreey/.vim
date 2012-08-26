" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02
" Modify by Evan 

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ron"

" color terminal define
hi LineNr	  ctermfg=101	"	guifg     = darkgrey
hi Normal     guifg = cyan	guibg     = black
hi NonText    guifg = brown
hi comment    guifg = green
hi constant   guifg = cyan	gui       = bold
hi identifier guifg = cyan	gui       = NONE
hi statement  guifg = lightblue	gui   = NONE
hi preproc    guifg = Pink2
hi type       guifg = seagreen	gui   = bold
hi special    ctermfg = 35 guifg = yellow
hi ErrorMsg   guifg = Black	guibg     = Red
hi WarningMsg guifg = Black	guibg     = Green
hi cIf0       guifg = gray
hi Todo       guifg = Black	guibg     = orange
hi IncSearch		gui   = NONE 	guibg     = steelblue
hi title		guifg     = darkgrey
hi StatusLineNC		gui   = NONE 	guifg     = lightblue guibg = darkblue
hi StatusLine		gui   = bold	guifg     = cyan	guibg   = blue
hi label		guifg     = gold2     cterm    = bold
hi operator		guifg     = orange 	ctermfg   = yellow
hi clear Visual
hi Visual		term      = reverse cterm     = reverse gui     = reverse
hi Error		guibg     = Red
hi Cursor		guibg     = #60a060 	guifg = #00ff00
hi Search		guibg     = lightslateblue
hi DiffChange   	guibg = darkgreen
hi DiffText		guibg     = olivedrab
hi DiffAdd		guibg     = slateblue
hi DiffDelete   	guibg = coral
hi Folded		guibg     = gray30
hi FoldColumn		guibg = gray30 guifg      = white
hi Number     ctermfg=cyan
hi Macro      ctermfg=6
hi Comment     ctermfg=74 "cterm=italic terimanl not support italic :(
"hi Function   cterm=bold ctermfg=225
hi Keyword    cterm=bold ctermfg=148
"hi String     ctermfg=148
