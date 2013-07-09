" Copylift(c) 
" Author <lilijreey@gmail.com>
" Source repository: https://github.com/lilijreey/vim-highlight-cursor-word

" This is a simple plugin that highligh all same as cursor word.

if exists("g:loaded_high_cursorword") || &cp
  finish
endif
let g:loaded_high_cursorword = 1

" default is enable plugin if you not want enable
" you can let g:hcw_high_cursorword_open = 0 disable this plugin
if !exists("g:hcw_high_cursorword_open")
   let g:hcw_high_cursorword_open = 1
endif

" set default include chars, you can custom it. 
if !exists("g:hcw_hicursor_include_chars")
    let g:hcw_hicursor_include_chars= ['_', '@','$','?','-']
endif

"Highlight you can custom it
highlight AhcwGroup ctermbg=6 ctermfg=Green

if !exists("s:matchaddId") 
  let s:matchaddId = 0
endif

if !exists("s:lastCursorWord") 
  let s:lastCursorWord= ""
endif

if g:hcw_high_cursorword_open
  augroup HcwGroup
  au CursorHold * call Hcw_HighCurowWord()
  augroup END
endif

" enable this plugin
fun! Hcw_Enable()
  if g:hcw_high_cursorword_open
    return
  endif

  let g:hcw_high_cursorword_open = 1
  augroup HcwGroup
  au CursorHold * call Hcw_HighCurowWord()
  augroup END

endfunction

" disable this plugin
fun! Hcw_Disable()
  if g:hcw_high_cursorword_open == 0
    return
  end

  call Hcw_NohighCursorWord()
  au! HcwGroup
  let g:hcw_high_cursorword_open = 0
endfunction

" start highlight all word that same as cursor word
fun! Hcw_HighCurowWord()
    if 'n' != mode()
       return "just enable in normal mode
   endif 

   if s:CursorUnderWord() && (expand('<cword>') != s:lastCursorWord)
       call Hcw_NohighCursorWord()
       let s:matchaddId = matchadd("AhcwGroup", '\<' . expand('<cword>') . '\>')
   endif

endfunction

fun! Hcw_NohighCursorWord()
    if s:matchaddId 
        call matchdelete(s:matchaddId)
        let s:matchaddId = 0
    endif
endfunction

" return  0 is not under word, other is ok
fun s:CursorUnderWord()
     let cursorChar = getline('.')[col('.')-1] 
     let cursorCharNum = char2nr(cursorChar)

     " check char is in set [0-9,a-z,A-Z, g:hcw_hicursor_include_chars] 
     if  (cursorCharNum >= 48 && cursorCharNum <= 57)
         return 1
     elseif (cursorCharNum >= 65 && cursorCharNum <= 90) 
         return 1
     elseif (cursorCharNum >= 97 && cursorCharNum <= 122) 
         return 1
     elseif (0 != count(g:hcw_hicursor_include_chars, cursorChar))
         return 1
     else
         return 0
     endif
endfunction

