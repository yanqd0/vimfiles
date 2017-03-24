""" The config file only for gVim or MacVim

if OSX()
    " set fullscreen
    noremap <silent> <F11> :set fullscreen!<CR>
    noremap! <silent> <F11> <ESC>:set fullscreen!<CR>a
endif

try
    if OSX()
        set guifont=Source\ Code\ Pro\ For\ Powerline:h13
    elseif LINUX()
        set guifont=Source\ Code\ Pro\ For\ Powerline\ 13
    endif
catch
    if OSX()
        set guifont=Monaco:h14
    elseif LINUX()
        set guifont=Monospace\ 12
    endif
endtry

" Disable scroll bars
set guioptions-=r
set guioptions-=L
if &guioptions =~#'T'
    set guioptions-=T
    set guioptions-=m
endif
