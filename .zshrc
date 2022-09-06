#!/bin/bash
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval `dircolors ~/.dotfiles/.dircolors`

export PATH=$HOME/.dotfiles/bin:$HOME/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH
. ~/z/z.sh

# Inicializamos la variable WSL en caso de estar usando el Subsistema de Windows para Linux WSL
if [[ $WSL_DISTRO_NAME ]]; then
   WSL=1
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
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

# Which plugins would you like to load? git
plugins=(alias-tips
        dirhistory
        extract
        fancy-ctrl-z
        F-Sy-H
        globalias
        magic-enter
        zsh-autosuggestions
        zsh-navigation-tools
        colored-man-pages)

# Theme
ZSH_THEME="obraun"

# Carga todos los archivos dentro de scripts
for f in  ~/.dotfiles/scripts/*(DN); do source $f; done

ZSH_DISABLE_COMPFIX=false

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f "/home/elmo/.shopify-app-cli/shopify.sh" ] && source "/home/elmo/.shopify-app-cli/shopify.sh"

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#curl -sS https://starship.rs/install.sh | sh
eval "$(starship init zsh)"