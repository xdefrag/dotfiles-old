set fish_greeting ""

fish_default_key_bindings
fzf_key_bindings

set -x NVM_DIR ~/.nvm
set -x PATH ~/.config/composer/vendor/bin $PATH
set -x EDITOR vim
set -x VISUAL vim

source ~/.phpbrew/phpbrew.fish
source ~/.config/fish/nvm-wrapper/nvm.fish

alias vim nvim
