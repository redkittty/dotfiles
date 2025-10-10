#!/bin/sh

# Hyprland Autostart

# Programs for config
waybar &
swww-daemon &
nm-applet &
swaync &
hypridle &
systemctl --user start hyprpolkitagent &
hyprpm reload -nn &
hyprsunset &
swayosd-server &

# User Programs
steam -silent &
discord &
thunar --daemon &
