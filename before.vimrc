""" This should be executed before vimrc

silent function! OSX()
return has('macunix')
endfunction

silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
return  (has('win16') || has('win32') || has('win64'))
endfunction

if WINDOWS()
    set runtimepath+=$HOME/.vim
endif
