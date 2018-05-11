# startup
fish_default_key_bindings

if test -z $TMUX
    tmux attach; or tmux new -s main
end

# environment variables
set -gx MANPAGER "col -b | nvim -MR - "
set -gx SHELL (which fish)
set -U EDITOR nvim
set -U VISUAL nvim
set -U fisher_copy true

# the fuck
thefuck --alias | source
alias fish_key_reader /usr/local/bin/fish_key_reader

# cheat.sh
curl -s cheat.sh/:fish | source

# autojump
test -e /usr/local/share/autojump/autojump.fish; and source /usr/local/share/autojump/autojump.fish

# completion
test -e /usr/share/fish/completions; and source /usr/share/fish/completions/*

test -e ~/.config/fish/completions; and source ~/.config/fish/completions/*

not test -e ~/.local/share/fish/generated_completions; and fish_update_completions

# phpbrew
test -e ~/.phpbrew; and source ~/.phpbrew/phpbrew.fish

# go
test -e ~/go; and set -gx GOPATH ~/go; set -gx PATH ~/go/bin $PATH

# composer 
test -e ~/.composer; and set -gx PATH ~/.composer/vendor/bin $PATH

test -e ~/.config/composer; and set -gx PATH ~/.config/composer/vendor/bin $PATH

# osx python' bin
test -e ~/Library/Python/2.7/bin; and set -gx PATH ~/Library/Python/2.7/bin $PATH

test -e ~/Library/Python/3.6/bin; and set -gx PATH ~/Library/Python/3.6/bin $PATH

# common
abbr l "ls"
abbr ll "ls -l"
abbr c cd
abbr m mkdir
abbr r "rm -rf"

# dirs
abbr . "cd .."
abbr .. "cd ../.."
abbr ... "cd ../../.."
abbr .... "cd ../../../.."

# git
abbr gs "git status"
abbr gd "git diff"
abbr ga "git add ."
abbr gc "git commit"
abbr gcm "git commit -m"
abbr gco "git checkout"
abbr gss "git stash"
abbr gsa "git stash apply"
abbr gb "git branch"
abbr grh "git reset --hard"
abbr pull "git pull"
abbr push "git push"

# docker-compose
abbr dcu "docker-compose up -d"
abbr dcd "docker-compose down"
abbr dcp "docker-compose ps"
abbr dcs "docker-compose stop"
abbr dcl "docker-compose logs -f"
abbr dce "docker-compose exec"
abbr dcr "docker-compose restart"
abbr dcb "docker-compose build"

# apps
abbr cask "brew cask"
abbr ag "ag --follow --hidden"
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr mc vifm
abbr f vifm
abbr n newsboat
abbr m neomutt
abbr p pass
abbr df "df -h"

# fish config
abbr fc "nvim ~/.config/fish/config.fish; source ~/.config/fish/config.fish"
