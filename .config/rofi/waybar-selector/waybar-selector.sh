#!/bin/bash

WAYBAR_DIR="$HOME/.config/waybar"
THEMES_DIR="$WAYBAR_DIR/themes"
STYLE="$WAYBAR_DIR/style.css"
CONFIG="$WAYBAR_DIR/config"

# build list of themes by finding subdirectories
themes=()
for d in "$THEMES_DIR"/*/; do
    name=$(basename "$d")
    themes+=("$name")
done

# show in rofi
chosen=$(printf '%s\n' "${themes[@]}" | rofi -dmenu)

[ -z "$chosen" ] && exit 0

theme_dir="$THEMES_DIR/$chosen"

# important to have any and all imports in the main style.css
{
    echo '@import "colors.css";'
    echo "@import \"themes/$chosen/style.css\";"
} > "$STYLE"

# copy the theme config
cp "$theme_dir/config" "$CONFIG"