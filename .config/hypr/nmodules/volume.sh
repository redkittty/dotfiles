#!/bin/sh
MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')
swayosd-client --monitor "$MONITOR" --output-volume "$1"
