""" The main config file

set nocompatible                    " Be iMproved, not Vi compatible
let mapleader=","                   " Use ',' instead of default '\'

" Before {{{
if filereadable(expand("~/.vim/before.vimrc"))
    source ~/.vim/before.vimrc
endif

" }}}

" Plugins {{{
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    if filereadable(expand("~/.vim/plugins.vimrc"))
        source ~/.vim/plugins.vimrc
    endif
endif
" }}}

" colors {{{
syntax on                           " Open the syntax highlight
set background=dark                 " Dark the screen
set t_Co=256                        " To support many colorscheme
if isdirectory(expand("~/.vim/bundle/vim-monokai"))
    colorscheme molokai
else
    colorscheme desert
endif

" vim-indent-guides
if !has('gui')
    let g:indent_guides_auto_colors = 0
    highlight IndentGuidesOdd  ctermbg=grey
    highlight IndentGuidesEven ctermbg=darkgrey
endif
" }}}

" View {{{

" sign {{{
set number                          " Show line numbers
" set relativenumber                  " Show relative line numbers of cursor
if has("linebreak")
    set numberwidth=3               " Minimal number of columns to use for the line number
endif
" }}}

" cmd & status line {{{
set history=1000                    " The history number of ':' commands
if has("cmdline_info")
    set showcmd                     " Show (partial) command in the last line of the screen
    set ruler                       " Show the line and column number of the cursor position
endif
if has("wildmenu")
    set wildmenu
endif
if has("cmdline_compl")
    set wildmode=list:longest,full
endif
set wildignorecase                  " Ignore case of file and directory names when completion
set laststatus=2                    " Always show status line
" }}}

" curor & mouse {{{
if has("syntax")
    set cursorline                  " Highlight the screen line of the cursor
    " set cursorcolumn                " Highlight the screen column of the cursor
endif
set showmatch                       " Briefly jump to the matching one, when typing right bracket

if has("mouse")
    " set mouse=a                     " Enable the use of the mouse in all mode
    set mousehide                   " Mouse hidden when characters are typed
endif
" }}}

" TODO: buffer

" Window & Tab page {{{
if has("windows")
    set splitright                  " Put new splitting windows to the right
    set splitbelow                  " Put new splitting windows to the bottom
    set tabpagemax=50               " Maximum number of tab pages
endif
" }}}

" }}}

" Search {{{
if has("extra_search")
    set hlsearch                    " Highlight search result
    set incsearch                   " Search when typing
endif
set ignorecase                      " The case of normal letters is ignored when searching
set smartcase                       " Override the 'ignorecase' if contains upper case characters
if has("reltime")
    set redrawtime=500              " The time in milliseconds for redrawing the display
endif
" }}}

" Input {{{

" <Tab> {{{
set shiftround                      " Round indent to multiple of 'shiftwidth'.
set shiftwidth=4                    " Number of spaces for (auto)indent
set tabstop=4                       " Number of spaces that a <Tab> counts for
set softtabstop=-1                  " Delete 'tabstop' number of spaces when typing <BS>
set expandtab                       " Use 'tabstop' number of spaces to insert a <Tab>
set smarttab                        " A <Tab> inserts blanks smartly
" }}}

" indent {{{
set autoindent                      " Copy indent from current line when starting a new line
if has("smartindent")
    set smartindent                 " Do smart autoindenting when starting a new line
endif
if has("cindent")
    set cindent                     " Do smart autoindenting according to C rules
endif
set backspace=indent                " Allow backspacing over autoindent
set backspace+=eol                  " Allow backspacing over line breaks (join lines)
set backspace+=start                " Allow backspacing over the start of insert
" }}}

" list {{{
set list                            " List mode: Show blank characters like <Tab>
set listchars=tab:>-,trail:$        " Show <Tab> as >---
" }}}

" wrap {{{
set wrap                            " Wrap lines longer than window width
if has("linebreak")
    set linebreak                   " Wrap long lines only on display
    set breakat-=@                  " Adjust line break characters
    set showbreak=>\                " Show wrap breaks as...
    set breakindent                 " Wrap lines are visually indented
    set breakindentopt=min:40       " Minimum text width after 'breakindent'
    set breakindentopt+=shift:4     " Shift width after 'breakindent'
    set breakindentopt+=sbr         " Display 'showbreak' in the top of wrap line
endif
" }}}

" }}}

" clipboard {{{
if has("clipboard")
    set clipboard=unnamed           " Use the clipboard register '*' for all yank, delete, change

    if has("xterm_clipboard")
        set clipboard+=unnamedplus  " Use the clipboard register '*' either
    endif
endif
" }}}

" folding {{{
if has("folding")                   " `zj`, `zk`, `[z`, `]z` will be convenient
    set foldenable                  " Enalbe fold
    set foldcolumn=0                " Show at the left side of the Window by such width
    set foldnestmax=2               " The maximum of fold deep
    set foldminlines=4              " The minimum of lines to be folded
    set foldopen=all                " Open fold when cursor in
    set foldclose=all               " Close fold when cursor out

    if &foldmethod =~# "manual"     " Set 'fdm' if it's default
        if has("syntax")
            set foldmethod=syntax
        else
            set foldmethod=indent
        endif
    endif                           " or not to change
endif
" }}}

" backup & swap {{{
set backup                          " Make a backup before overwriting a file
if has("writebackup")
    set writebackup
endif
if !isdirectory(expand("~/.vim/.backup"))
    call mkdir($HOME . "/.vim/.backup", "p")
endif                               " Make sure the 'backupdir' exists
set backupdir=~/.vim/.backup/       " The directory for backup
set backupskip+=.git/*              " A list of file patterns which no backup
set backupcopy=auto                 " Auto choose copy or override
set backupext=.bak                  " A string appended to backup file names
" set patchmode=.org                  " A string appended to patch file names, don't use

set swapfile                        " Use a swapfile for the buffer
if !isdirectory(expand("~/.vim/.tmp"))
    call mkdir($HOME . "/.vim/.tmp", "p")
endif                               " Make sure the 'directory' exists
set directory=~/.vim/.tmp

set autoread                        " Auto load when changes outside vim detected
" set autowrite                       " Auto write when changing the buffer, too dangerous!
" }}}

" other {{{
" TODO: Sort options below.
set formatoptions+=tcroqwbmBj       " see :h fo-table
if has("multi_byte")
    set fileencodings=ucs-bom,utf-8
    set fileencodings+=EUC-CN,cp936,GBK,GB2312,GB18030
    set fileencodings+=big5,EUC-TW,cp950
    set fileencodings+=EUC-JP,cp932,Shift_JIS
    set fileencodings+=EUC-KR,cp949
    set fileencodings+=latin1,default
    scriptencoding utf-8
endif
set fileformats=unix,dos,mac        " The <EOL> of the current buffer
set nofileignorecase                " File name case sensitive
set noautochdir                     " Don't auto change current directory
" }}}

" TODO: set spell

" autocmd {{{
if has("autocmd")
    " Restore the cursor line when reopen a file
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$")
                \ | exe "normal! g'\""
                \ | endif

    " Java {{{
    autocmd filetype java set textwidth=100
    autocmd filetype java set colorcolumn=100
    autocmd filetype java map <F5> :w!<CR>:execute "!javac % && java %:t:r"<CR>
    autocmd filetype java imap <F5> <ESC>:w!<CR>:execute "!javac % && java %:t:r"<CR>a
    " }}}

    " Python {{{
    autocmd filetype python set textwidth=80
    autocmd filetype python set colorcolumn=80
    autocmd filetype python map <F5> :w!<CR>:execute "!python -u %"<CR>
    autocmd filetype python imap <F5> <ESC>:w!<CR>:execute "!python -u %"<CR>a
    " }}}

    " sh {{{
    autocmd filetype sh set textwidth=80
    autocmd filetype sh set colorcolumn=80
    autocmd filetype sh map <F5> :w!<CR>:execute "!source %"<CR>
    autocmd filetype sh imap <F5> <ESC>:w!<CR>:execute "!source %"<CR>a
    " }}}

    " vim {{{
    autocmd filetype vim set textwidth=80
    autocmd filetype vim set colorcolumn=80
    autocmd filetype vim map <F5> :w!<CR>:source %<CR>
    autocmd filetype vim imap <F5> <ESC>:w!<CR>:source %<CR>a
    " }}}

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
endif
" }}}

" Maps {{{

" Windows {{{
if has("windows")
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
endif
" }}}

" Tab pages {{{
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" }}}

" cscope {{{
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-,f-
    " Add or kill cscope tags connection
    nnoremap <leader>sa :cs add ~/.vim/.tags/cscope.out<CR>
                \:set tags=~/.vim/.tags/tags<CR>
    nnoremap <leader>sk :cscope kill .<CR>
    " 0 or s: Find this C symbol
    nnoremap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
    " 1 or g: Find this definition
    nnoremap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
    " 2 or d: Find functions called by this function
    nnoremap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
    " 3 or c: Find functions calling this function
    nnoremap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
    " 4 or t: Find this text string
    nnoremap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
    " 6 or e: Find this egrep pattern
    nnoremap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
    " 7 or f: Find this file
    nnoremap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
    " 8 or i: Find files #including this file
    nnoremap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
endif
" }}}

" Personal maps {{{
" Paste to system clipboard
nnoremap <leader>pc :let @*=@"<CR>
" Set current window directory same as current file
nnoremap <leader>cd :lcd %:p:h<CR>
" Reload vimrc
nnoremap <leader>rc :source $MYVIMRC<CR>
" Open vimrc
nnoremap <leader>oc :vsplit $MYVIMRC<CR>
" Transform current file or selection to HTML
noremap <leader>th :TOhtml<CR>
" }}}

" }}}

" After {{{
if filereadable(expand("~/.vim/after.vimrc"))
    source ~/.vim/after.vimrc
endif
" }}}

" local {{{
if filereadable(expand('./.vimrc.local'))
    source ./.vimrc.local
endif
" }}}

" vim: set shiftwidth=4 softtabstop=-1 expandtab foldmethod=marker:
" vim: set textwidth=100 colorcolumn=100:
