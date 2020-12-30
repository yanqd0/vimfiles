""" The plugin config

" Specify a directory for plugins
call plug#begin('~/.vim/vim-plug')   " vim-plug required

" Syntax color {{{

" Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized'}
" let g:solarized_menu=0

Plug 'tomasr/molokai'
let g:molokai_original = 0
let g:rehash256 = 0

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Plug 'zenorocha/dracula-theme', {'rtp': 'vim'}
" Plug 'lsdr/monokai'
Plug 'sickill/vim-monokai'

" indent {{{

" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_indent_levels = 10
" let g:indent_guides_auto_colors = 1

" Disable indent for vim-cute-python
" Plug 'Yggdroot/indentLine'
" let g:indentLine_setConceal = 0

" }}}

" }}}

" Input {{{

" completion {{{

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-x><C-p>'
let g:SuperTabMappingForward = '<Tab>'
let g:SuperTabMappingBackward = '<S-Tab>'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_auto_trigger = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_invoke_completion = '<C-/>'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_detailed_diagnostics = '<leader>yd'
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1,
            \ 'android_log' : 1,
            \}

" }}}

" comment {{{

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

" }}}

" move {{{

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
map <Space> <Plug>(easymotion-s2)
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

Plug 'kshenoy/vim-signature'

" }}}

" pair {{{

Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1       " <CR> complete a line
let delimitMate_expand_space = 1    " <Space> complete another space behind
let delimitMate_jump_expansion = 1  " Jump can cross lines
let delimitMate_excluded_ft = 'mail,txt'
augroup vimrc
    autocmd FileType vim,html,xml,vue,django let b:delimitMate_matchpairs = '(:),[:],{:}'
augroup END

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml,vue,django'

" }}}

" Snippets {{{

Plug 'SirVer/ultisnips'
noremap <leader>us :UltiSnipsEdit<CR>
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/.Snippets'
let g:UltiSnipsSnippetDirectories = ['.Snippets', 'UltiSnips']
" Local snippets directory is `.Snippets`
" Remote snippets directory is `UltiSnips`, provided by snippets-for-vim

Plug 'yanqd0/snippets-for-vim'

" }}}

Plug 'tpope/vim-repeat'

" }}}

" tags {{{

Plug 'majutsushi/tagbar'
noremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width = 40             " Width of the Tagbar window
let g:tagbar_autofocus = 1          " Jump to Tagbar window on open
let g:tagbar_show_linenumbers=2     " Show relative line numbers
let g:tagbar_singleclick = 1        " Single-click on a tag jumps to it

Plug 'vim-scripts/taglist.vim'
noremap <silent> <F8> :TlistToggle<CR>
" let Tlist_Auto_Open=1               " Open taglist when start-up
let Tlist_GainFocus_On_ToggleOpen=1 " Jump to taglist window on open
let Tlist_Close_On_Select=1         " Close the taglist window when selected
let Tlist_Exit_OnlyWindow=1         " Close Vim if the taglist is the only window
let Tlist_Enable_Fold_Column=1      " Show the fold indicator column
let Tlist_File_Fold_Auto_Close=1    " Fold all other buffers
let Tlist_Use_Right_Window=1        " Place the taglist window on the right side
let Tlist_Use_SingleClick=1         " Single-click on a tag jumps to it
let Tlist_WinWidth = 60             " Width of the Taglist window

" }}}

" View {{{

" navigate {{{

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_history = &history
let g:ctrlp_max_files = 30000
let g:ctrlp_max_depth = 10
let g:ctrlp_mruf_max = 250
let g:ctrlp_lazy_update = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|env|venv)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_nolim = 1
nnoremap <Leader>cp :CtrlPFunky<CR>
nnoremap <Leader>cf :execute 'CtrlPFunky ' . expand('<cword>')<CR>

" Replace CtrlP with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:ctrlp_map = ''
noremap <silent> <c-p> :FZF<CR>

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
noremap <silent> <F6> :NERDTreeToggle<CR>
noremap <C-F6> :NERDTreeFind<CR>
" let loaded_nerd_tree=1              " Open NERD tree when start-up
let NERDTreeChDirMode=2             " Set the root of NERD tree as current directory
" let NERDTreeQuitOnOpen=1            " Closes the tree window after opening a file
let NERDTreeShowBookmarks=1         " The bookmarks table will be displayed
let NERDTreeWinPos=0                " Show the window at the left (1 means right)
let NERDTreeWinSize=32              " Window size when the NERD tree is opened
let NERDTreeRespectWildIgnore=1     " the 'wildignore' setting is respected
let NERDTreeMouseMode=2             " Double click file and single click directory
let NERDTreeAutoDeleteBuffer=1      " Auto delete invalid buffers
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" brew install ag

" }}}

" syntastic checking {{{
" Plug 'scrooloose/syntastic'
" noremap <silent> <F3> :SyntasticCheck<CR>
" noremap <silent> <F4> :SyntasticToggleMode<CR>
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_java_checkers=['javac']
" let g:syntastic_java_javac_config_file_enabled = 1
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" `pip install --user flake8 pylint` for Python
" `brew install tidy-html5` for HTML5
" `pip install --user vim-vint` for Vim
" let g:syntastic_vim_checkers = ['vint']

Plug 'w0rp/ale'
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_echo_msg_format = '%linter% %severity% %code: %%s'
" brew install hadolint
" pip install flake8 isort yapf pylint vint yamllint ansible-lint
" yarn global add alex vue-language-server eslint prettier tslint tsserver bash-language-server
let g:ale_linters = {
            \ 'python': ['flake8', 'yapf', 'isort', 'pylint', 'mypy', 'pydocstyle'],
            \ }
let g:ale_fixers = {
            \ 'python': ['yapf', 'isort'],
            \ 'javascript': ['eslint'],
            \ 'json': ['jq', 'fixjson'],
            \ 'xml': ['xmllint'],
            \ 'html': ['prettier'],
            \ 'sql': ['pgformatter'],
            \ 'dot': ['trim_whitespace'],
            \ }
let g:ale_use_global_executables = 0
let g:ale_markdown_mdl_executable = 'markdownlint'
noremap <c-\> :ALEGoToDefinition<CR>
noremap ]a :ALENext<CR>
noremap [a :ALEPrevious<CR>
noremap <F2> :ALEFix<CR>
" }}}

" status line {{{

" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
" let g:Powerline_symbols="unicode"

python3 << endpython
try:
    from powerline.vim import setup as powerline_setup
    powerline_setup()
    del powerline_setup
except ImportError:
    pass
endpython

" Plug 'bling/vim-airline'

" }}}

Plug 'sjl/gundo.vim'
noremap <Leader>ud :GundoToggle<CR>
let g:gundo_right = 1               " Let the Gundo graph window at the right
let g:gundo_preview_bottom = 1      " Let the preview window at the bottom

Plug 'vim-scripts/TaskList.vim'
if !hasmapto('<Plug>TaskList')
    map <unique> <Leader>td <Plug>TaskList
endif

" }}}

" Git {{{

Plug 'airblade/vim-gitgutter'
noremap <silent> <leader>gg <ESC>:GitGutterToggle<CR>:GitGutterLineHighlightsToggle<CR>
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_escape_grep = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

Plug 'tpope/vim-fugitive'

" Plug 'github/git-lfs'

" }}}

" Markdown {{{

" tabularize {{{
Plug 'godlygeek/tabular'

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>table_auto_align()<CR>a

function! s:table_auto_align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|'
                \ && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" }}}

" syntax {{{

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1

Plug 'MikeCoder/markdown-preview.vim'
noremap <leader>m :MarkdownPreviewWithCustomCodeStyleCodeStyle GitHub monokai_sublime<CR>

" }}}

Plug 'junegunn/goyo.vim'
let g:goyo_width = 100

" }}}

" Python {{{

" Plug 'klen/python-mode'           " Deprecated by YouCompleteMe
" Plug 'pythoncomplete'             " Deprecated by YouCompleteMe
" Plug 'nvie/vim-flake8'            " Not necessary if syntastic is on.
" Plug 'yanqd0/vim-cute-python'

" Plug 'Chiel92/vim-autoformat'
" let g:formatter_yapf_style = 'facebook'
" Plug 'fisadev/vim-isort'
" noremap <F2> :Autoformat<CR>:Isort<CR>
" }}}

" rst {{{

" Plug 'Rykka/riv.vim'
" Plug 'Rykka/InstantRst'
" pip install git+https://github.com/Rykka/instant-rst.py.git
" pip3 install hovercraft

" }}}

" Golang {{{

Plug 'fatih/vim-go'
let g:go_version_warning = 0
Plug 'nsf/gocode', {'rtp': 'vim'}

" }}}

" Vimperator {{{

Plug 'superbrothers/vim-vimperator'

" }}}

" cvs {{{

Plug 'chrisbra/csv.vim'

" }}}

" HTML {{{

Plug 'gorodinskiy/vim-coloresque'

" https://emmet.io/
Plug 'mattn/emmet-vim'

" }}}

" TOML {{{
" See: https://github.com/toml-lang/toml

Plug 'cespare/vim-toml'

" }}}

Plug 'rizzatti/dash.vim'


call plug#end()                     " Initialize plugin system
filetype plugin indent on

" vim: set shiftwidth=4 softtabstop=-1 expandtab:
" vim: foldenable foldmethod=marker foldmarker={{{,}}} foldminlines=2:
" vim: set textwidth=100 colorcolumn=100:
