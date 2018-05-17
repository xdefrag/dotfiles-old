" neovim only

" must have {{{
set nocompatible
set encoding=utf8
set shell=/bin/bash
" }}}

" dein {{{
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " essentials {{{
    " solorized colorscheme
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('iCyMind/NeoSolarized')
    " fancy start screen with recent files
    call dein#add('mhinz/vim-startify')
    " filebrowser
    call dein#add('scrooloose/nerdtree')
    " advanced yanking
    call dein#add('svermeulen/vim-easyclip')
    " buff tabs
    call dein#add('ap/vim-buftabline')
    " fuzzy finder
    call dein#add('junegunn/fzf')
    call dein#add('junegunn/fzf.vim', {
                \ 'build' : './install --all',
                \ })
    " easymotion
    call dein#add('easymotion/vim-easymotion')
    " incsearch
    call dein#add('haya14busa/incsearch.vim')
    call dein#add('haya14busa/incsearch-easymotion.vim')
    call dein#add('haya14busa/incsearch-fuzzy.vim')
    " git
    call dein#add('mhinz/vim-signify')
    call dein#add('tpope/vim-fugitive')
    " undo history
    call dein#add('sjl/gundo.vim')
    " . support for a bunch of plugins
    call dein#add('tpope/vim-repeat')
    " simple status bar
    call dein#add('itchyny/lightline.vim')
    " advanced commenting
    call dein#add('tpope/vim-commentary')
    " advanced word substitiution
    call dein#add('tpope/vim-abolish')
    " changing surround symbols
    call dein#add('tpope/vim-surround')
    " the_silver_searcher interface
    call dein#add('wincent/ferret')
    " code quality tools
    call dein#add('neomake/neomake')
    " list of class methods, variables etc
    call dein#add('majutsushi/tagbar')
    " debugger
    call dein#add('joonty/vdebug')
    " autoclosing pair symbols
    call dein#add('Townk/vim-autoclose')
    " snippet manager
    call dein#add('Shougo/neosnippet.vim')
    " editorconfig support
    call dein#add('editorconfig/editorconfig-vim')
    " autotag
    call dein#add('craigemery/vim-autotag')
    " }}}

    " markdown {{{
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')
    " }}}

    " json {{{
    call dein#add('elzr/vim-json', { 'on_ft' : 'json' })
    " }}}

    " php {{{
    " better syntax coloring
    call dein#add('StanAngeloff/php.vim', { 'on_ft' : 'php' })
    " autocomplete
    call dein#add('lvht/phpcd.vim', {
                \ 'on_ft' : 'php',
                \ 'build' : 'composer install',
                \ })
    " indenting and correcting simple errors on save
    call dein#add('stephpy/vim-php-cs-fixer', { 'on_ft' : 'php' })
    " advanced refactoring tools
    call dein#add('adoy/vim-php-refactoring-toolbox', { 'on_ft' : 'php' })
    " php use
    call dein#add('arnaud-lb/vim-php-namespace', { 'on_ft' : 'php' })
    " }}}

    " js {{{
    call dein#add('ternjs/tern_for_vim', {
                \ 'on_ft' : 'js',
                \ 'build' : 'npm i',
                \ })
    " }}}

    " go {{{
    call dein#add('fatih/vim-go', {
                \ 'on_ft' : 'go',
                \ 'build' : ':GoUpdateBinaries' })
    " }}}

    " lua {{{
    " call dein#add('tbastos/vim-lua', { 'on_ft' : 'lua' })
    call dein#add('xolox/vim-misc', { 'on_ft' : 'lua' })
    call dein#add('xolox/vim-lua-ftplugin', { 'on_ft' : 'lua' })
    " }}}

    " autocomplete {{{
    " deoplete
    call dein#add('Shougo/deoplete.nvim', {
                \ 'build' : ':UpdateRemotePlugins',
                \ })
    " python
    call dein#add('zchee/deoplete-jedi')
    " js
    call dein#add('carlitux/deoplete-ternjs', {
                \ 'build' : 'npm i -g tern',
                \ })
    " go
    call dein#add('zchee/deoplete-go', { 
                \ 'on_ft' : 'go',
                \ 'build' : 'make' })
    " emojis, yeah!
    call dein#add('fszymanski/deoplete-emoji')
    " }}}

    " misc {{{
    " }}}

    call dein#end()
    call dein#save_state()
endif

" on nvim startup check that all packages installed
if dein#check_install()
    call dein#install()
endif
" }}}

" netrw {{{
" disabling netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" }}}

" nvim config {{{
let mapleader="\<Space>"
let $VIMDIR=expand('<sfile>:p:h')
set ruler
set hidden
set noshowmode
set backspace=indent,eol,start
set cursorline
set signcolumn=yes

" fuzzy find
set path+=**
set wildmenu

" fancy searching
set ignorecase
set hlsearch
set incsearch
set lazyredraw

" brackets
set showmatch

" no errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" no backup
set nobackup
set nowb
set noswapfile

" tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" indent
set autoindent
set smartindent
set copyindent
set cindent

" splits
set splitbelow
set splitright

" status line
set laststatus=2

" fold
set foldenable
set foldlevelstart=1
set foldnestmax=10
set foldmethod=indent

" colorscheme
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set t_Co=256
set background=dark

" lightline fix
colorscheme solarized
colorscheme NeoSolarized

" }}}

" plugins config {{{
" lightline
let g:lightline = {
            \ 'colorscheme' : 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ] ]
            \ },
            \ }

" startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = ['']
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/.config/vifm/vifmrc',
            \ '~/.config/fish/config.fish',
            \ ]

" easyclip
set clipboard=unnamed
let g:EasyClipAutoFormat = 1
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipShareYanks = 1
let g:EasyClipUseSubstituteDefaults = 1

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMapActivateNode = 'l'

" signify
let g:signify_realtime = 1
let g:signify_sign_show_test = 0
let g:signify_vcs_list = [ 'git' ]

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#ignore_sources.lua = ['omni']

" neosnippet
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" neomake {{{
call neomake#configure#automake('nrwi')
let g:neomake_highlight_lines = 1
let g:neomake_open_list = 0

let g:neomake_php_enabled_makers = ['phpstan']
let g:neomake_fish_enabled_makers = []

" symbols
let g:neomake_error_sign = {
            \ 'text': 'E',
            \ }
let g:neomake_warning_sign = {
            \ 'text': 'W',
            \ }
let g:neomake_info_sign = {
            \ 'text': 'I',
            \ }
let g:neomake_message_sign = {
            \ 'text': 'M',
            \ }
" }}}

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1

" vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

" vdebug
let g:vdebug_options= {
            \    "port" : 9001,
            \    "server" : '',
            \    "timeout" : 20,
            \    "on_close" : 'detach',
            \    "break_on_open" : 1,
            \    "ide_key" : '',
            \    "path_maps" : { 
            \    "/var/www/api-data" : "/Users/xdefrag/Code/takelook/api/src",
            \    },
            \    "debug_window_level" : 0,
            \    "debug_file_level" : 0,
            \    "debug_file" : "",
            \    "watch_window_style" : 'expanded',
            \    "marker_default" : '=',
            \    "marker_closed_tree" : '+',
            \    "marker_open_tree" : '-'
            \ }
let g:vdebug_keymap = {
            \    "run" : "<leader>dr",
            \    "run_to_cursor" : "<leader>dt",
            \    "step_over" : "<leader>do",
            \    "step_into" : "<leader>di",
            \    "step_out" : "<leader>du",
            \    "close" : "<leader>dc",
            \    "detach" : "<leader>dd",
            \    "set_breakpoint" : "<leader>db",
            \    "get_context" : "<leader>dg",
            \    "eval_under_cursor" : "<leader>d",
            \    "eval_visual" : "<leader>de",
            \ }

" fzf
let g:fzf_command_prefix = 'Fzf'

" ternjs deoplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" go deoplete
let g:deoplete#sources#go#gocode_binary = 'gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vdebug
let g:vdebug_options = {
            \ 'port' : 9001,
            \ }
" }}}

" helpers {{{
" easymotion + incsearch
function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \   },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction

" easymotion + incserach-fuzzy
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

" php use
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

" tmux cursor fix
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" keybindings {{{

" misc
nnoremap j gj
nnoremap k gk
inoremap jk <esc>
inoremap jj <esc>
nnoremap B ^
nnoremap E $

"
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

"
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" 
xnoremap <  <gv
xnoremap >  >gv

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" buffers
nnoremap <silent> q :bd<CR>
nnoremap <silent> Q :qa!<CR>
nnoremap <silent> <Tab> :bnext<CR> 
nnoremap <silent> <S-Tab> :bprev<CR>

" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easymotion
nmap f <Plug>(easymotion-overwin-f)
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" neosnippet
nnoremap <silent> <leader>ne :NeoSnippetEdit -split<CR>

" php
autocmd FileType php inoremap <C-u> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php inoremap <C-e> <Esc>:call IPhpExpandClass()<CR>

" common
nnoremap <silent> <leader>lt :TagbarToggle<CR>

" indent
nnoremap <silent> g= mzgg=G`z

" fzf
nnoremap <silent> <leader>ff :FzfFiles<CR>
nnoremap <silent> <leader>fb :FzfBuffers<CR>
nnoremap <silent> <leader>fa :FzfAg<CR>
nnoremap <silent> <leader>ft :FzfTags<CR>
nnoremap <silent> <leader>fu :FzfSnippets<CR>
nnoremap <silent> <leader>fc :FzfCommits<CR>
nnoremap <silent> <leader>fh :FzfHistory<CR>

" snippets
imap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
smap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <silent> <C-k> <Plug>(neosnippet_expand_target)

" gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" easyclip
nnoremap <silent> <leader>ys :Yanks<CR>

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" vim config
nnoremap <silent> <leader>vc :e $MYVIMRC<CR>
nnoremap <silent> <leader>vr :so $MYVIMRC<CR>

" disabling unneeded keys 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <bs> <nop>
nnoremap <delete> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <Space> <nop>
inoremap <F1> <nop>
nnoremap <F1> <nop>
inoremap <esc> <nop>
nnoremap $ <nop>
nnoremap ^ <nop>

" debug

" }}}

" restoring settings
syntax enable
filetype plugin indent on

