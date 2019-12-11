#!/bin/bash

alias ls='ls --color=auto'
alias du='du -h'
alias myip='curl ipinfo.io/ip'
alias apti='sudo apt install --yes -V'
alias apts='apt search $1'
alias aptp='sudo apt purge -V'
alias cp='cp -i'
alias mv='mv -i'

alias c='xclip-copyfile'
alias p='xclip-pastefile'
alias d='xclip-cutfile'


alias lh='ls -d .*' # only hidden files
alias la="ls -AXb --group-directories-first --sort=extension"
alias ln="ln -sv"
alias lsda="lsd -A --group-dirs first --classify"
alias lsdo="lsd -A --group-dirs first --classify --recursive --depth=2"
alias l='ls -l'
alias lla='ls -la'
alias lt='ls --tree'
alias reloaddns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

alias l='lsd'

# Laravel
alias a='php artisan'
alias ams='php artisan migrate:fresh --seed'

# Archivos de proyectos
alias dev='cd ~/dev/www'

# Git
alias commit='git add . && git commit -m'
alias gcommit='git add . && git commit'
alias amend='git commit --amend --no-edit'
alias amendall='git add . && amend'
alias wip='commit wip'
alias gst='git status'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias resolve='git add . && git commit --no-edit'
alias gl='git log --oneline --decorate --color'
alias nuke='git clean -df && git reset --hard'
alias gacp="git add . && git commit -m 'autocommit' && git push"


alias ptest='vendor/bin/phpunit'

## Aliases para WSL en Windows
if [[ $WSL ]]; then
    alias subl="subl.exe $1"
else
	alias subl=subl
fi

# tmux aliases
alias tmux='tmux has-session -t $USER || tmux new-session -s $USER &&  tmux -2 attach-session -t $USER'

alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tkill='\tmux kill-session -a'


# Admin linux
alias sysd="sudo systemctl disable"
alias syse="sudo systemctl enable"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"