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
    " fancy start screen with recent files
    call dein#add('mhinz/vim-startify')
    " filebrowser
    call dein#add('scrooloose/nerdtree')
    " advanced yanking
    call dein#add('vim-scripts/YankRing.vim')
    " fuzzy finder
    call dein#add('/usr/local/opt/fzf')
    call dein#add('junegunn/fzf.vim')
    " git
    call dein#add('tpope/vim-fugitive')
    call dein#add('mhinz/vim-signify')
    " undo history
    call dein#add('sjl/gundo.vim')
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
    " }}}

    " php {{{
    " better syntax coloring
    call dein#add('StanAngeloff/php.vim', { 'on_ft' : 'php'})
    " mighty plugin for php composer project: autocomplete, refactoring,
    " managing use statements etc
    call dein#add('phpactor/phpactor', {
                \ 'build' : 'composer install',
                \ 'on_ft' : 'php',
                \ })
    " indenting and correcting simple errors on save
    call dein#add('stephpy/vim-php-cs-fixer', { 'on_ft' : 'php'})
    " advanced managing php use statements
    call dein#add('arnaud-lb/vim-php-namespace', { 'on_ft' : 'php' })
    " advanced refactoring tools
    call dein#add('adoy/vim-php-refactoring-toolbox', { 'on_ft' : 'php' })
    " }}}

    " autocomplete {{{
    " deoplete
    call dein#add('Shougo/deoplete.nvim', {
                \ 'build' : 'UpdateRemotePlugins',
                \ })
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
set ruler
set hidden
set noshowmode
set nu
set relativenumber
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
set foldenable
set foldlevelstart=1
set foldnestmax=10
set foldmethod=indent

" colorscheme
set background=dark
colorscheme solarized
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

" nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMapActivateNode = 'l'

" fzf
let g:fzf_command_prefix = 'Fzf'

" deoplete
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" neomake
call neomake#configure#automake('w')

" phpactor
autocmd FileType php setlocal omnifunc=phpactor#Complete

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1


" vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0

" vdebug
let g:vdebug_options = {
            \ 'port' : 9001,
            \ }

" simplenote
" g:SimplenoteUsername, g:SimplenotePassword
source ~/dotfiles/simplenoterc

" }}}

" helpers {{{
" ctags
command! MakeTags !ctags -R .

" 
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
nnoremap <silent> <leader>o :oldfiles<CR>

inoremap <esc> <nop>
nnoremap $ <nop>
nnoremap ^ <nop>

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" buffers
nnoremap <silent> q :bdelete<CR>
nnoremap <silent> <Tab> <C-w>w 
nnoremap <silent> <S-Tab> <C-w>W 

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

" php
autocmd FileType php nnoremap <silent> <leader>ld :call phpactor#GotoDefinition()<CR>
autocmd FileType php nnoremap <silent> <leader>lm :call phpactor#ContextMenu()<CR>
autocmd FileType php nnoremap <silent> <leader>la :call phpactor#UseAdd()<CR>
autocmd FileType php nnoremap <silent> <leader>lc :call phpactor#CopyFile()<CR>
autocmd FileType php nnoremap <silent> <leader>lu :call IPhpInsertUse()<CR>

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

" snippets
imap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
smap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <silent> <C-k> <Plug>(neosnippet_expand_target)

" gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" simplenote
nnoremap <silent> <leader>snl :SimplenoteList<CR>
nnoremap <silent> <leader>sns :SimplenoteUpdate<CR>
nnoremap <silent> <leader>snn :SimplenoteNew<CR>
nnoremap <silent> <leader>snd :SimplenoteTrash<CR>
" }}}

" restoring settings
syntax enable
filetype plugin indent on

