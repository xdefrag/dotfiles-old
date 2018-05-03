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

# completion
if test -e /usr/share/fish/completions
    source /usr/share/fish/completions/*
end

if test -e ~/.config/fish/completions
    source ~/.config/fish/completions/*
end

if not test -e ~/.local/share/fish/generated_completions
    fish_update_completions
end

# phpbrew
if test -e ~/.phpbrew
    source ~/.phpbrew/phpbrew.fish
end

# go
if test -e ~/go
    set -gx GOPATH ~/go
    set -gx PATH ~/go/bin $PATH
end

# composer 
if test -e ~/.composer
    set -gx PATH ~/.composer/vendor/bin $PATH
end

if test -e ~/.config/composer
    set -gx PATH ~/.config/composer/vendor/bin $PATH
end

# osx python' bin
if test -e ~/Library/Python/2.7/bin
    set -gx PATH ~/Library/Python/2.7/bin $PATH
end

if test -e ~/Library/Python/3.6/bin
    set -gx PATH ~/Library/Python/3.6/bin $PATH
end

# common
abbr l "ls -a"
abbr ll "ls -la"
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
