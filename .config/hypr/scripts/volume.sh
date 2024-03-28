#!/bin/sh

down() {
  pamixer -d 2
  volume=$(pamixer --get-volume)
  [$volume -gt 0 ] && volume=`expr $volume`  
  canberra-gtk-play -i audio-volume-change -d "changevolume"
}

up() {
  pamixer -i 2
  volume=$(pamixer --get-volume)
  [ $volume -lt 1000 ] && volume=`expr $volume`  
  canberra-gtk-play -i audio-volume-change -d "changevolume"
}

mute() {
  muted="$(pamixer --get-mute)"
  if $muted; then
    pamixer -u
  else 
    pamixer -m
  fi
}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
esac