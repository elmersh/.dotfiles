#!/bin/bash
# Development stuff

# shopify
alias fypull='shopify theme pull'
alias fyserv='shopify theme serve'
alias fypush='shopify theme push'

# MongoDB
alias mongoin='mongosh  "mongodb://root:asdfbr%21%21%21@localhost:27017"'

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
function commit {
  git add . && git commit -m "$1"
}
function glog {
  git log --graph --oneline --decorate --color --all
}

# checkout main branch
alias gchm='git checkout main'
alias ginit="git init && git add . && git commit -m 'Inicializando proyecto'"
alias amend='git commit --amend --no-edit'
alias amendall='git add . && amend'
alias wip='commit wip'
alias gchw='git checkout $(date +%d%b%Y)'
alias gchn='git checkout -b $(date +%d%b%Y)'
alias gmw='git merge $(date +%d%b%Y)'
alias gmw='git merge main'
alias resolve='git add . && git commit --no-edit'
alias nuke='git clean -df && git reset --hard'
alias gac="git add . && git commit -m 'algo se hizo acá...'"


alias ptest='vendor/bin/phpunit'

# Aliases para WSL en Windows
if [[ $WSL ]]; then
    alias subl="subl.exe $1"
fi

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

# npm
alias npi='npm install'
alias nrd='npm run dev'
alias nrp='npm run prod'

# yarn
alias yar='yarn'
alias yara='yarn add'
alias yarad='yarn add --dev'

# git clone
function gcl {
  git clone git@haciendola:Haciendola-Developers/$(pwd | grep -o '[^/]*$').git
}


# automation for the following commands: mkd, gcl, gchn, fy
function ko {
  # si no hay argumentos, salir
  if [ -z "$1" ]; then
  # echo "No hay argumentos, ingresar el nombre de la tienda..." con fondo rojo y texto blanco
    echo -e "\e[1;31mNo hay argumentos, ingresar el nombre de la tienda...\e[0m"
    echo -e "\e[1;32mEjemplo: ko nombre-tienda\e[0m"
    return
  fi
  # Revisar si no estamos en el directorio
  if [ "$1" != "$(pwd | grep -o '[^/]*$')" ]; then
    # Si no existe, lo creamos
    if [ ! -d "$1" ]; then
      echo -e "\e[1;32mCreando directorio $1...\e[0m"
      mkdir $1
      cd $1
    else
      echo -e "\e[1;32mEl proyecto $1 ya existe...\e[0m"
      cd $1
    fi
  else
    echo "\e[1;31mYa estás en $1...\e[0m"
    return
  fi
  

  # Si el directorio está vacío, clonamos el repositorio
  if [ -z "$(ls -A)" ]; then
    echo -e "\e[1;32mClonando repositorio...\e[0m"
    git clone git@haciendola:Haciendola-Developers/$(pwd | grep -o '[^/]*$').git .
  else
    echo "\e[1;31mEl directorio no está vacío...\e[0m"
    return
  fi

  # checkout new branch
  if [ "$(git branch --show-current)" = "main" ]; then
    echo -e "\e[1;32mCreando rama $(date +%d%b%Y)...\e[0m"
    git checkout -b $(date +%d%b%Y)
  else
    echo "\e[1;31mNo estás en la rama main...\e[0m"
    return
  fi

  if [ "$(git branch --show-current)" = "$(date +%d%b%Y)" ]; then
    echo -e "\e[1;32mAbriendo en Visual Studio Code...\e[0m"
    code .
    echo -e "\e[1;32mIniciando shopify dev\e[0m"
    shopify theme dev --store $(pwd | grep -o '[^/]*$')
  else
    echo -e "\e[1;31mNo se pudo crear la rama $(date +%d%b%Y)...\e[0m"
    return
  fi
}