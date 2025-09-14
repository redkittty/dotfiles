#!/bin/bash

search_dir=$WALLPAPER_DIR

options=""
for entry in "$search_dir"/*
do
  filename=$(basename "$entry")
  options+="$filename\n"
done

# Show the Rofi menu and get the selection
selection=$(echo -e "$options" | rofi -dmenu -p "Select a background")

if [ -n "$selection" ]; then
  background="$search_dir/$selection"
  swww img "$background" --transition-step 255 --transition-type center
  echo "Wallpaper changed to $selection"
  notify-send "Wallpaper changed to $selection"
else
  echo "No selection made."
  exit 1
fi
