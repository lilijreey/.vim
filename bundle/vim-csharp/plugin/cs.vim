" Vim plugin file
" Language:     Microsoft C#
" Maintainer:   Kian Ryan (kian@orangetentacle.co.uk)
" Last Change:  2012 Sep 23


" Set msproj file extensions
au BufNewFile,BufRead *.cs compiler mcs
au BufNewFile,BufRead *.proj compiler mcs | set filetype=xml
au BufNewFile,BufRead *.csproj compiler mcs | set filetype=xml
au BufNewFile,BufRead *.sln compiler mcs | set filetype=xml
au BufNewFile,BufRead *.cshtml compiler mcs | set filetype=cshtml.html syntax=cshtml
au BufNewFile,BufRead *.aspx compiler mcs | set filetype=aspx.html syntax=aspx
au BufNewFile,BufRead *.ascx compiler mcs | set filetype=aspx.html syntax=aspx
au BufNewFile,BufRead *.master compiler mcs | set filetype=aspx.html syntax=aspx

