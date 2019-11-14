#!/bin/bash

function mkd {
  mkdir -p "$@" && cd "$_";
}


# for webm videos to mp4
function webm2mp4 {
  for file in *.webm
  do 
    ffmpeg -i "$file" "`basename "$file" .webm` .mp4"
  done
}

# mp4 to mp3

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

# Encrypt a file to myself

function ei {
  gpg -er C19D1580 $1
}

# Decrypt a file

function di {
  gpg -do $1 $2
}

weather() { curl -4 wttr.in/${1:-sv} }

