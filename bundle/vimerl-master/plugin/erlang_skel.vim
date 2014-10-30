" Author:   Ricardo Catalinas Jiménez <jimenezrick@gmail.com>
" License:  Vim license
" Version:  2012/11/25

if exists('g:loaded_erlang_skel') || v:version < 700 || &compatible
	finish
else
	let g:loaded_erlang_skel = 1
endif

if !exists('g:erlang_skel_replace')
	let g:erlang_skel_replace = 1
endif

if !exists('g:erlang_skel_dir')
	let g:erlang_skel_dir = expand('<sfile>:p:h') . '/erlang_skels'
endif

function s:LoadSkeleton(skel_name)
	"if g:erlang_skel_replace
		"%delete
	"else
		"let current_line = line('.')
		"call append(line('$'), '')
		"normal G
	"endif
	if exists('g:erlang_skel_header')
		execute 'read' g:erlang_skel_dir . '/' . 'header'
		for [name, value] in items(g:erlang_skel_header)
			call s:SubstituteField(name, value)
		endfor

		call append(line('$'), '')
		normal G
	endif
	execute 'read' g:erlang_skel_dir . '/' . a:skel_name
	call s:SubstituteField('modulename', expand('%:t:r'))
	if g:erlang_skel_replace
		normal gg
		delete
	else
		call cursor(current_line, 1)
	endif
endfunction

" 替换模板中的$变量
function s:SubstituteField(name, value)
	execute '%substitute/\$' . toupper(a:name) . '/' . a:value . '/'
endfunction

au BufNewFile *.erl exec "silent call s:LoadSkeleton('header')"

command ErlangApplication silent call s:LoadSkeleton('application')
command ErlangSupervisor  silent call s:LoadSkeleton('supervisor')
command ErlangGenServer   silent call s:LoadSkeleton('gen_server')
command ErlangGenFsm      silent call s:LoadSkeleton('gen_fsm')
command ErlangGenEvent    silent call s:LoadSkeleton('gen_event')
command ErlangCommonTest  silent call s:LoadSkeleton('common_test')
command ErlangPlayerMod   silent call s:LoadSkeleton('player_mod')
command ErlangPangzi      silent call s:LoadSkeleton('pangzi')
command ErlangConfig      silent call s:LoadSkeleton('config')
"
"
"
