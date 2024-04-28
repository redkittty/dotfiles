#!/bin/sh
# Arch WM Selection Script
# Installs additional programs for a wm
PS3="Select your WM/DE: "
options=("Hyprland" "Awesome" "OtherX11" "Other")
select wm in "${options[@]}"; do
  case $wm in
    "Hyprland")
      WM="HYPRLAND"
      sudo pacman -Syyu waybar hyprpaper wl-clipboard blueman
      git clone https://aur.archlinux.org/hyprpicker-git.git && cd hyprpicker-git && makepkg -si && cd ..
      ;;
    "Awesome")
      WM="AWESOME"
      sudo pacman -Syyu picom blueman rofi rofi-emoji rofi-calc
      # Xrandr Monitor Settings
      xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00 --output eDP-1 --mode 1920x1080 --rate 59.98 --left-of HDMI-1
      git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome/awesome-wm-widgets
      ;;
    "OtherX11")
      WM="OTHERX11"
      xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144.00 --output eDP-1 --mode 1920x1080 --rate 59.98 --left-of HDMI-1
      ;;
    "Other")
      WM="OTHER"
      break
      ;;
    *)
      echo "Invalid Choice"
      ;;
  esac
done

chmod +x ./aur.sh
source ./aur.sh
