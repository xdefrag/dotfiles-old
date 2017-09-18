" base
syntax on
set encoding=utf8
set ruler
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

" keymap
nmap <F3> :browse oldfiles<CR>

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on

" nerdtree
nmap <F2> :NERDTreeToggle<CR>
