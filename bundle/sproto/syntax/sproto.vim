" SProto Simple data interchange format
" Author lilijreey@126.com

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword pbTodo       contained TODO FIXME XXX
syn cluster pbCommentGrp contains=pbTodo

syn match pbSyntax     /@include/
syn keyword pbDefault    enum struct message empty disable
syn keyword pbRPC        proto server client errnos options

syn keyword pbType      s8 s16 s32 s64 u8 u16 u32 u64 bool sstr lstr list binary
syn keyword pbTypedef   typedef

syn match   pbInt     /-\?\<\d\+\>/
"syn match   pbInt     /\<0[xX]\x+\>/
syn region  pbComment start="//" skip="\\$" end="$" keepend contains=@pbCommentGrp
syn region  pbComment start="#" skip="\\$" end="$" keepend contains=@pbCommentGrp
syn region  pbString  start=/"/ skip=/\\./ end=/"/
syn region  pbString  start=/'/ skip=/\\./ end=/'/

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

let b:current_syntax = "sproto"
