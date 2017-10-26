" base
set nocompatible
syntax enable
filetype plugin on
set encoding=utf8
set ruler

"" fuzzy find
set path+=**
set wildmenu

"" ctags
command! MakeTags !ctags -R .

"" ins-completion ^x^f by filename, ^x^] by tag

"" fancy searching
set ignorecase
set hlsearch
set incsearch
set lazyredraw

"" brackets
set showmatch

"" no errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" no backup
set nobackup
set nowb
set noswapfile

"" tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"" status line TODO make it fancy
set laststatus=2

"" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altw=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


