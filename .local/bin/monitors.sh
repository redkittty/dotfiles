#!/bin/sh

# Toggle External Montior
intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
  xrandr --output eDP-1 --primary --mode 1920x1080 --rate 59.98
else
  xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00 --output eDP-1 --mode 1920x1080 --rate 59.98 --left-of $extern
fi
