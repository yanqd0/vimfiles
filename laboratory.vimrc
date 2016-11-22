
match WarningMsg /\k*\%#\k*/        " highlight current cursor word

highlight MyBlank ctermbg=red ctermfg=black guibg=red guifg=black
match MyBlank /\t\|\r\|\s\s*\n/

map <leader>ff :call FormatFile()<CR>
function! FormatFile()
    %s/\s*$//g                      " Delete tail blanks
    retab                           " Replace <TAG> by <Space>
    normal gg=G
endfunction

" Delete consecutive same lines
map <leader>dsc :g/^\(.*\)$\n\1$/d<CR>

" Delete consecutive same empty lines
map <leader>dse :g/^\s*$\n\s*$/d<CR>

map <leader>dsl :call DeleteSameLine()<CR>
function! DeleteSameLine()
    let i=1|g/^/s//\=i.':'/|let i+=1
    sort /^\d\{-}:/
    g/^\d\{-}:\(.*\)$\n\d\{-}:\1$/d
    sort n
    %s/\d\{-}://
endfunction
