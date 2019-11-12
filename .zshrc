#!/bin/bash
export PATH=$HOME/bin:/usr/local/bin:$HOME/.config/composer/vendor/bin:$PATH
# A little helper to find out what operating system are we using.
if grep -q Microsoft /proc/version; then
    WSL=1
fi

export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Options
setopt hist_ignore_dups
setopt hist_expire_dups_first

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -v && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="lsda && echo -e '\n'"

# Which plugins would you like to load?
plugins=(alias-tips
        dirhistory
        extract
        fancy-ctrl-z
        fast-syntax-highlighting
        git
        globalias
        magic-enter
        zsh-autosuggestions
        zsh-navigation-tools
        colored-man-pages)

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

for f in  ~/.dotfiles/zsh/*(DN); do source $f; done


ZSH_DISABLE_COMPFIX=true

ENABLE_CORRECTION="true"



source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
