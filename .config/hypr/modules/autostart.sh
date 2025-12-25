#!/bin/sh

# Hyprland Autostart

# Programs for config
exec waybar &
exec swww-daemon &
exec nm-applet &
exec swaync &
exec hypridle &
exec systemctl --user start hyprpolkitagent &
exec hyprpm reload -nn &
exec hyprsunset &
exec swayosd-server &
exec udiskie -a -T &

# User Programs
exec steam &
exec discord &
