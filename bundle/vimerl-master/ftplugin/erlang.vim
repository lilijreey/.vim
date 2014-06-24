" Vim ftplugin file
" Language:     Erlang
" Author:       Oscar Hellström <oscar@oscarh.net>
" Contributors: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>
"               Eduardo Lopez (http://github.com/tapichu)
" License:      Vim license
" Version:      2012/11/25

if exists('b:did_ftplugin')
	finish
else
	let b:did_ftplugin = 1
endif


if exists('s:did_function_definitions')
	call s:SetErlangOptions()
	finish
else
	let s:did_function_definitions = 1
endif

if !exists('g:erlang_keywordprg')
	let g:erlang_keywordprg = 'erl -man'
endif

" 是否自动folding
"let g:erlang_folding=1

if !exists('g:erlang_folding')
	let g:erlang_folding = 0
endif

let s:erlang_fun_begin = '^\(\a\w*\|[''][^'']*['']\)(.*$'
let s:erlang_fun_end   = '^[^%]*\.\s*\(%.*\)\?$'

function s:SetErlangOptions()
	compiler erlang
	if version >= 700
		setlocal omnifunc=erlang_complete#Complete
	endif

	if g:erlang_folding
		setlocal foldmethod=expr
		setlocal foldexpr=GetErlangFold(v:lnum)
		setlocal foldtext=ErlangFoldText()
	endif

	setlocal comments=:%%%,:%%,:%
	setlocal commentstring=%%s
	setlocal formatoptions+=ro
	setlocal suffixesadd=.erl
  " add by evan include stdlib, kernel menisa src tags
  setlocal tags+=~/.vim/bundle/vimerl-master/ftplugin/erl_sys_tags

  "setlocal iskeyword+=?
	let libs = substitute(system('which erl'), '/bin/erl', '/lib/erlang/lib/**/src/', '')
	execute 'setlocal path+=' . libs
	let &l:keywordprg = g:erlang_keywordprg
endfunction

function GetErlangFold(lnum)
	let lnum = a:lnum
	let line = getline(lnum)

	if line =~ s:erlang_fun_end
		return '<1'
	endif

	if line =~ s:erlang_fun_begin && foldlevel(lnum - 1) == 1
		return '1'
	endif

	if line =~ s:erlang_fun_begin
		return '>1'
	endif

	return '='
endfunction

function ErlangFoldText()
	let line    = getline(v:foldstart)
	let foldlen = v:foldend - v:foldstart + 1
	let lines   = ' ' . foldlen . ' lines: ' . substitute(line, "[ \t]*", '', '')
	if foldlen < 10
		let lines = ' ' . lines
	endif
	let retval = '+' . v:folddashes . lines

	return retval
endfunction

call s:SetErlangOptions()

"function Parse_trans_beam(module)
  "!escript ~/.vim/bundle/vimerl-master/bin/parse_trans_pp.beam a:module
"endfunction

"command ErlangCommonTest  silent call s:LoadSkeleton('common_test')


let b:undo_ftplugin = exists("b:undo_ftplugin") ? b:undo_ftplugin . "|" : ""

nnoremap <silent> <buffer> ]] :<C-U>call <SID>declaration('', 'n', v:count1)<CR>
nnoremap <silent> <buffer> [[ :<C-U>call <SID>declaration('b', 'n', v:count1)<CR>
nnoremap <silent> <buffer> ][ :<C-U>call <SID>declaration_end('', 'n', v:count1)<CR>
nnoremap <silent> <buffer> [] :<C-U>call <SID>declaration_end('b', 'n', v:count1)<CR>

vnoremap <silent> <buffer> ]] :<C-U>call <SID>declaration('', 'v', v:count1)<CR>
vnoremap <silent> <buffer> [[ :<C-U>call <SID>declaration('b', 'v', v:count1)<CR>
vnoremap <silent> <buffer> ][ :<C-U>call <SID>declaration_end('', 'v', v:count1)<CR>
vnoremap <silent> <buffer> [] :<C-U>call <SID>declaration_end('b', 'v', v:count1)<CR>
let b:undo_ftplugin .= " exe 'unmap <buffer> [[' |  exe 'unmap <buffer> ]]' |  exe 'unmap <buffer> []' |  exe 'unmap <buffer> ]['"

nnoremap <silent> <buffer> ]m :<C-U>call <SID>clause('', 'n', v:count1)<CR>
nnoremap <silent> <buffer> [m :<C-U>call <SID>clause('b', 'n', v:count1)<CR>
nnoremap <silent> <buffer> ]M :<C-U>call <SID>clause_end('', 'n', v:count1)<CR>
nnoremap <silent> <buffer> [M :<C-U>call <SID>clause_end('b', 'n', v:count1)<CR>

vnoremap <silent> <buffer> ]m :<C-U>call <SID>clause('', 'v', v:count1)<CR>
vnoremap <silent> <buffer> [m :<C-U>call <SID>clause('b', 'v', v:count1)<CR>
vnoremap <silent> <buffer> ]M :<C-U>call <SID>clause_end('', 'v', v:count1)<CR>
vnoremap <silent> <buffer> [M :<C-U>call <SID>clause_end('b', 'v', v:count1)<CR>
let b:undo_ftplugin .= " | exe 'unmap <buffer> [m' |  exe 'unmap <buffer> ]m' |  exe 'unmap <buffer> [M' |  exe 'unmap <buffer> ]M'"


fun! s:declaration(flags, mode, count)
  call s:go_to('\(\.\|\%^\)\_s*\(%.*\n\|\_s\)*\n*\_^\s*\zs[a-z][a-zA-Z_0-9]*(', a:flags, '', a:mode, a:count)
endfun

fun! s:declaration_end(flags, mode, count)
  call s:go_to('\.\w\@!', a:flags, 'erlangComment\|erlangString\|erlangSkippableAttributeDeclaration', a:mode, a:count)
endfun

fun! s:clause(flags, mode, count)
  call s:go_to('\(\.\|\%^\|\;\)\_s*\(%.*\n\|\_s\)*\n*\_^\s*\zs[a-z][a-zA-Z_0-9]*(', a:flags, '', a:mode, a:count)
endfun

fun! s:clause_end(flags, mode, count)
  call s:go_to('\(\.\w\@!\|[\;\.]\_s*\(%.*\n\|\_s\)*\n*\_^\s*[a-z][a-zA-Z_0-9]*(\)', a:flags, 'erlangComment\|erlangString\|erlangSkippableAttributeDeclaration', a:mode, a:count)
endfun

fun! s:go_to(pattern, flags, skip_syn, mode, count)
  norm! m'
  if a:mode ==# 'v'
    norm! gv
  endif

  let match_count = a:count
  while match_count > 0
    let match_count -= 1

    let line = line('.') | let col  = col('.')
    let pos = search(a:pattern,'W'.a:flags)

    if len(a:skip_syn) > 0
      while pos != 0 && s:synname() =~# a:skip_syn
        let pos = search(a:pattern,'W'.a:flags)
      endwhile
    endif

    if pos == 0
      call cursor(line,col)
      return
    endif
  endwhile
endfunction

function! s:synname()
  return join(map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")'), ' ')
endfunction

function! s:around(back, forward)
  execute 'norm h'
  execute 'norm ' . a:forward . a:back . 'V' . a:forward
endfunction

function! s:inside(back, forward)
  execute 'norm h'
  execute 'norm ' . a:forward . a:back
  call search('->\n\?\s*.', 'We')
  execute 'norm ' . 'v' . a:forward . 'h'
endfunction
