""" The config file only for gVim or MacVim

if OSX()
    set guifont=Monaco:h14
    set fullscreen
    noremap <silent> <F11> :set fullscreen!<CR>
    noremap! <silent> <F11> <ESC>:set fullscreen!<CR>a
elseif LINUX()
    set guifont=Monospace\ 12
endif

" Disable scroll bars
set guioptions-=r
set guioptions-=L
if &guioptions =~#'T'
    set guioptions-=T
    set guioptions-=m
endif


