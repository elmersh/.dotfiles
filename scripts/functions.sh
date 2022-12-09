#!/bin/bash

# Crear nuevo directorio e ingresar al mismo
function mkd {
  mkdir -p "$@" && cd "$_";
}


# convertir videos webm a mp4
function webm2mp4 {
  for file in *.webm
  do 
    ffmpeg -i "$file" "`basename "$file" .webm` .mp4"
  done
}

# mp4 a mp3

function mp42mp3 {
  CURRENTMP4HERE=$(ls *.mp4 | wc -l)
  notify-send "Found $CURRENTMP4HERE mp4s, gonna convert them now, be patient"

  for file in *.mp4
  do
    ffmpeg -y -i "$file" "`basename "$file" .mp4`.mp3"
  done



  notify-send "All $CURRENTMP4HERE mp4s have been converted to mp3s and now we are moving them to your music dir"
  CURRENTMP3INMPD=$(ls $HOME/mus/*.mp3 | wc -l)



  notify-send "You have $CURRENTMP3INMPD mp3s in your database"
  mv *.mp3 ~/mus/ -v



  notify-send "All mp3s have been moved to music dir."
  TOTAL=$(($CURRENTMP3INMPD + $CURRENTMP4HERE))


  notify-send "You have got $CURRENTMP4HERE new mp3s. Now you have $TOTAL songs in database. Enjoy your music"
}


function speedup {
  base=$(basename $1)
  ext="${base##*.}"
  base="${base%.*}"

  ffmpeg -i $1 -filter:v "setpts=0.5*PTS"  $base'_speed.'$ext


  notify-send "your video has got speed. Enjoy"
}


# Encriptar un archivo a mi mismo
function ei {
  gpg -er C19D1580 $1
}

# Desencriptar archivo

function di {
  gpg -do $1 $2
}

# Muestra el tiempo en la región elegida
weather() { curl -4 wttr.in/${1:-sv} }


function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* ./*;
    fi;
  }


# Abre el archivo o directorio en tu editor por defecto
ed ()
{
  "$EDITOR" "$@"
}


ram () 
{
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
    sum=$(($i + $sum))
  done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
  if [[ $sum != "0" ]]; then
    echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
  else
    echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
  fi
  fi
}

bkp ()
{
  cp -riv $1 ${1}-$(date +%d-%m-%Y-%H:%M).bak
}
