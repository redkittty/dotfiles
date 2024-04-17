#!/bin/sh
# WM Package installer selection script for ARCH
PS3="Select your WM/DE"
options=("Hyprland" "Other")
select wm in "${options[@]}"; do
  case $wm in
    "Hyprland")
      wm="HYPRLAND"
      sudo pacman -S waybar hyprpaper
      chmod +x ./aur.sh
      source ./aur.sh
      ;;
    "Other")
      chmod +x ./aur.sh
      source ./aur.sh
      ;;
    *)
      echo "Invalid choice."
      chmod +x ./aur.sh
      source ./aur.sh
      ;;
  esac
done
