#!/bin/sh

# Hyprland Autostart

# Programs for config
exec waybar &
exec awww-daemon &
exec nm-applet &
exec swaync &
exec hypridle &
exec systemctl --user start hyprpolkitagent &
exec blueman-applet &
#exec hyprpm reload -nn &
exec hyprsunset &
exec swayosd-server &
exec udiskie -a -T &
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &\

# Hypr Portal
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &

# User Programs
exec steam &
exec vesktop --enable-blink-features=MiddleClickAutoscroll &
