#!/bin/bash
# ~/.config/hypr/hyprlock/Scripts/songdetail.sh

# Get current playing song from playerctl
if command -v playerctl &> /dev/null; then
    # Check if any player is running
    if playerctl status &> /dev/null; then
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)

        if [[ -n "$artist" && -n "$title" ]]; then
            echo "♪ $artist - $title"
        elif [[ -n "$title" ]]; then
            echo "♪ $title"
        else
            echo "♪ Music Playing"
        fi
    else
        echo ""
    fi
else
    echo ""
fi
