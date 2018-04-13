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
    " advanced selecting
    call dein#add('gcmt/wildfire.vim')
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
    call dein#add('tpope/vim-fugitive')
    call dein#add('mhinz/vim-signify')
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
    " project individual config
    call dein#add('amiorin/vim-project')
    " autoclosing pair symbols
    call dein#add('Townk/vim-autoclose')
    " snippet manager
    call dein#add('Shougo/neosnippet.vim')
    " editorconfig support
    call dein#add('editorconfig/editorconfig-vim')
    " distraction free mode
    call dein#add('junegunn/goyo.vim')
    
    " }}}

    " php {{{
    " better syntax coloring
    call dein#add('StanAngeloff/php.vim', { 'on_ft' : 'php'})
    " autocomplete
    call dein#add('lvht/phpcd.vim', {
                \ 'on_ft' : 'php',
                \ 'build' : 'composer install',
                \ })
    " indenting and correcting simple errors on save
    call dein#add('stephpy/vim-php-cs-fixer', { 'on_ft' : 'php'})
    " advanced managing php use statements
    call dein#add('arnaud-lb/vim-php-namespace', { 'on_ft' : 'php' })
    " advanced refactoring tools
    call dein#add('adoy/vim-php-refactoring-toolbox', { 'on_ft' : 'php' })
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
    " simplenote integration
    call dein#add('mrtazz/simplenote.vim')
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
" disabling netrw in favor of nerdtree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" }}}

" nvim config {{{
let mapleader="\<Space>"
let $VIMDIR=expand('<sfile>:p:h')
set ruler
set hidden
set noshowmode
" set nu
" set relativenumber
set backspace=indent,eol,start
set cursorline

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
set cindent

" splits
set splitbelow
set splitright

" status line
set laststatus=2

" fold
" set foldenable
" set foldlevelstart=1
" set foldnestmax=10
" set foldmethod=indent

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
            \ 'component_function' : {
            \ 'gitbranch' : 'fugitive#head',
            \ }
            \ }

" startify
let g:startify_change_to_vcs_root = 1

" easyclip
set clipboard=unnamed
let g:EasyClipAutoFormat = 1
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipShareYanks = 1
let g:EasyClipUseSubstituteDefaults = 1

" wildfire
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it']

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" goyo
let g:goyo_width = 120
let g:goyo_height = '100%'
let g:goyo_linenr = 0

" nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMapActivateNode = 'l'

" deoplete
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" neomake {{{
" run on write
call neomake#configure#automake('w')

" maker settings 
" let g:neomake_javascript_jscs_maker = {
"     \ 'exe': 'jscs',
"     \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
"     \ 'errorformat': '%f: line %l\, col %c\, %m',
"     \ }
" let g:neomake_javascript_enabled_makers = ['jscs']

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

" phpcd
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1

" fzf
let g:fzf_command_prefix = 'Fzf'

" vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0

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

" simplenote
" g:SimplenoteUsername, g:SimplenotePassword
source ~/dotfiles/simplenoterc

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

" ctags
command! MakeTags !ctags -R .

" php uses
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
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
nnoremap B ^
nnoremap E $
nnoremap <silent> <leader>o :browse oldfiles<CR>

inoremap <esc> <nop>
nnoremap $ <nop>
nnoremap ^ <nop>

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" buffers
nnoremap <silent> q :bdelete<CR>
nnoremap <silent> <Tab> <C-w>w 
nnoremap <silent> <S-Tab> <C-w>W
nnoremap <silent> <leader>bp :bprev<CR>
nnoremap <silent> <leader>bn :bnext<CR>

" split
nnoremap <silent> <leader>sj <C-W><C-J>
nnoremap <silent> <leader>sk <C-W><C-K>
nnoremap <silent> <leader>sl <C-W><C-L>
nnoremap <silent> <leader>sh <C-W><C-H>
nnoremap <silent> <leader>so <C-W>o
nnoremap <silent> <leader>sn <C-W>=
nnoremap <silent> <leader>sv :vsp<CR>
nnoremap <silent> <leader>ss :sp<CR>
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>

" goyo
nnoremap <silent> <leader>df :Goyo<CR>

" easymotion
nmap f <Plug>(easymotion-overwin-f)
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" git fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>

" php
autocmd FileType php nnoremap <silent> <leader>ld <C-]>
autocmd FileType php inoremap <silent> <C-u> <ESC>:call IPhpInsertUse()<CR>i

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

" simplenote
" nnoremap <silent> <leader>snl :SimplenoteList<CR>
" nnoremap <silent> <leader>sns :SimplenoteUpdate<CR>
" nnoremap <silent> <leader>snn :SimplenoteNew<CR>
" nnoremap <silent> <leader>snd :SimplenoteTrash<CR>

" easyclip
nnoremap <silent> <leader>ys :Yanks<CR>

" wildfire

" vim config
nnoremap <silent> <leader>vc :edit ~/dotfiles/nvim/init.vim<CR>
nnoremap <silent> <leader>vr :so $MYVIMRC<CR>
" }}}

" restoring settings
syntax enable
filetype plugin indent on

