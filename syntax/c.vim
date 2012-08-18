"highlight Function 
syn match cFunction display "[a-zA-Z_]\{-1,}\s\{-0,}(\{1}"ms=s,me=e-1
hi def link cFunction Function
