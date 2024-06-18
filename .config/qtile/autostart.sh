#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# Utilities
nm-applet &
flameshot &
picom &
conky -c ~/.config/conky/qtile.conkyrc &
/usr/bin/emacs --daemon &
dunst &
xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00 --output eDP-1 --mode 1920x1080 --rate 59.98 --left-of HDMI-1 &
