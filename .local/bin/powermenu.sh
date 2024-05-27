#!/bin/sh
# Rofi Power Menu
chosen=$(printf "⏻  Power Off\n  Restart" | rofi -dmenu -i)

case "$chosen" in
  "⏻  Power Off") poweroff ;;
  "  Restart") reboot ;;
  *) exit 1 ;;
esac
