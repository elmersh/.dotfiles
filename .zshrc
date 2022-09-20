#!/bin/bash
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
if [[ ${machine} == 'Mac' ]]; then
  source $HOME/.dotfiles/scripts/.amac
fi

export PATH=$HOME/.yarn/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$MAMP_PHP:$MAMP_MYSQL:$PATH
. ~/z/z.sh


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
plugins=(
  alias-tips
  git
  dirhistory
  extract
  fancy-ctrl-z
  fast-syntax-highlighting
  globalias
  magic-enter
  zsh-autosuggestions
  zsh-navigation-tools
  colored-man-pages
  macos
)

# Theme
# ZSH_THEME="powerlevel10k/powerlevel10k" robbyrussell zhann tonotdo philips sorin nanotech
#ZSH_THEME="jnrowe"

# Carga todos los archivos dentro de scripts
for f in  ~/.dotfiles/scripts/*(DN); do source $f; done

ZSH_DISABLE_COMPFIX=false

source $ZSH/oh-my-zsh.sh

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ENABLE_CORRECTION="false"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f "/home/elmersh/.shopify-app-cli/shopify.sh" ] && source "/home/elmersh/.shopify-app-cli/shopify.sh"

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
