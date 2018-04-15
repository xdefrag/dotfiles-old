set fish_greeting ""

fish_default_key_bindings
fzf_key_bindings

set -gx GOPATH ~/go
set -gx PATH ~/.config/composer/vendor/bin ~/.composer/vendor/bin $GOPATH/bin $PATH
set -gx MANPAGER "col -b | nvim -MR - "
set -gx EDITOR vim
set -gx VISUAL vim

source ~/.config/fish/completions/*

alias vim nvim
