# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/bash
export PATH=$HOME/.dotfiles/bin:$HOME/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin:$PATH
. ~/z/z.sh
# Flatpak app directory
export XDG_DATA_DIRS="$HOME/.local/share:/var/lib/flatpak/exports/share:/home/elmo/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# Inicializamos la variable WSL en caso de estar usando el Subsistema de Windows para Linux WSL
if [[ $WSL_DISTRO_NAME ]]; then
   WSL=1
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
    if [[ $WSL ]]; then
        export EDITOR='subl'
    else
        export EDITOR='subl'
    fi
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
        fast-syntax-highlighting
        globalias
        magic-enter
        zsh-autosuggestions
        zsh-navigation-tools
        colored-man-pages)

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"



# Carga todos los archivos dentro de scripts
for f in  ~/.dotfiles/scripts/*(DN); do source $f; done


ZSH_DISABLE_COMPFIX=true





source $ZSH/oh-my-zsh.sh




if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ENABLE_CORRECTION="false"

[ -f "/home/elmo/.shopify-app-cli/shopify.sh" ] && source "/home/elmo/.shopify-app-cli/shopify.sh"
