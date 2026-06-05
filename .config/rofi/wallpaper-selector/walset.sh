#!/bin/bash

WALL_DIR="$HOME/Pictures/Matugen"
WALSET_BACKEND="$HOME/.config/rofi/wallpaper-selector/walset-backend.sh"

# current directory to cd back to (debugging)
CWD="$(pwd)"

cd "$WALL_DIR" || exit 1

IFS=$'\n' # handle spaces in file names

#SELECTED_WALL=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "" -theme-str 'element-icon { size: 155px; } listview { columns: 2; lines: 4; spacing: 10px; } element-text { enabled: false; }') # grab selected wallpaper
SELECTED_WALL=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "" -theme ~/.config/rofi/wallpaper-selector/walset.rasi)

# pass selected wallpaper to the backend script that will run matugen
if [ -n "$SELECTED_WALL" ]; then
    $WALSET_BACKEND "$SELECTED_WALL"
fi

cd "$CWD" || exit 1