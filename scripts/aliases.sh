#!/bin/bash
# Development stuff

# shopify
alias fypull='shopify theme pull'
alias fyserv='shopify theme serve'

# other

alias du='du -h'
alias myip='curl ipinfo.io/ip'

alias cuak='sudo apt install --yes -V'
alias fapp='apt search'
alias cuek='sudo apt purge -V'
alias cp='cp -i'
alias mv='mv -i'

alias co='xclip-copyfile'
alias pa='xclip-pastefile'
alias cu='xclip-cutfile'

alias lh='ls -d .*' # only hidden files
alias la="ls -AXb --group-directories-first --sort=extension"
alias ln="ln -sv"
alias lsda="lsd -A --group-dirs first --classify"
alias lsdo="lsd -A --group-dirs first --classify --recursive --depth=2"
alias l='ls -l'
alias lla='ls -la'
alias lt='ls --tree'
# alias reloaddns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

alias l='lsd'

# Laravel
alias a='php artisan'
alias amfs='php artisan migrate:fresh --seed'

# Archivos de proyectos
alias dev='cd ~/Dev'

# Git
alias commit='git add . && git commit -m'
alias ginit="git init && git add . && git commit -m 'Inicializando proyecto'"
alias gcommit='git add . && git commit'
alias amend='git commit --amend --no-edit'
alias amendall='git add . && amend'
alias wip='commit wip'
alias gstatus='git status'
alias gb='git branch'
alias gch='git checkout'
alias gdiff='git diff'
alias resolve='git add . && git commit --no-edit'
alias gl='git log --oneline --decorate --color'
alias nuke='git clean -df && git reset --hard'
alias gacp="git add . && git commit -m 'autocommit' && git push"


alias ptest='vendor/bin/phpunit'

## Aliases para WSL en Windows
# if [[ $WSL ]]; then
#     alias subl="subl.exe $1"
# fi

# tmux aliases
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

# Services
alias mariaon='sudo systemctl start mysql'
alias mariaoff='sudo systemctl stop mysql'