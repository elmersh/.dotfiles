#!/bin/bash

alias ls='ls --color=auto'
alias du='du -h'
alias ipp='curl ipinfo.io/ip'
alias api='sudo apt install --yes -V'
alias aps='apt search $1'
alias apg='sudo apt purge -V'
alias cp='cp -i'
alias mv='mv -i'

alias reloaddns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# Laravel
alias a='php artisan'
alias ams='php artisan migrate:fresh --seed'

alias dev='cd ~/Dev'

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
alias ptest='vendor/bin/phpunit'

## Things related to other operating systems like WSL on windows.
if [[ $WSL ]]; then
        alias subl="subl.exe $1"
fi
