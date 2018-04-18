set fish_greeting ""

fish_default_key_bindings
fzf_key_bindings

set -gx GOPATH ~/go
set -gx PATH ~/.config/composer/vendor/bin  $GOPATH/bin $PATH
set -gx EDITOR vim
set -gx VISUAL vim

source ~/.config/fish/completions/*
source ~/.phpbrew/phpbrew.fish

alias vim nvim
