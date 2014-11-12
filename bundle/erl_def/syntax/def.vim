" Def erlang contar deftion
" Author lilijreey@126.com

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword pbTodo       contained TODO FIXME XXX
syn cluster pbCommentGrp contains=pbTodo

"syn keyword pbSyntax     syntax import option
syn keyword pbTypedef   enum atom eatom

"syn match   pbInt     /-\?\<\d\+\>/
"syn match   pbInt     /\<0[xX]\x+\>/
syn region  pbComment start="%" skip="\\$" end="$" keepend contains=@pbCommentGrp
syn region  pbComment start="#" skip="\\$" end="$" keepend contains=@pbCommentGrp
"syn region  pbString  start=/"/ skip=/\\./ end=/"/
"syn region  pbString  start=/'/ skip=/\\./ end=/'/

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pbTodo         Todo

  HiLink pbSyntax       Include
  HiLink pbStructure    Structure
  HiLink pbRepeat       Repeat
  HiLink pbDefault      Keyword
  HiLink pbExtend       Keyword
  HiLink pbRPC          Keyword
  HiLink pbType         Type
  HiLink pbTypedef      Typedef
  HiLink pbBool         Boolean

  HiLink pbInt          Number
  HiLink pbFloat        Float
  HiLink pbComment      Comment
  HiLink pbString       String

  delcommand HiLink
endif

let b:current_syntax = "def"
