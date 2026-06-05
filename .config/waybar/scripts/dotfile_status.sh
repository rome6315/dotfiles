#!/bin/bash

# Set the path to your Git repository
REPO_PATH="$HOME/dotfiles"

cd "$REPO_PATH"

# ignore these files since all they do is change colors
#IGNORE_FILES='waybar/style.css|cava/config|dunst/dunstrc|hypr/scripts/set_wallpaper.sh|hypr/theme.conf|kitty/current-theme.conf|kitty/kitty.conf|kitty/kitty.conf.bak|nwg-dock-hyprland/theme.css|rofi/config.rasi|starship/starship.toml|scripts/theme-switcher/current_theme.txt'
IGNORE_FILES='dunstrc|starship.toml|kitty/themes/Matugen.conf|kitty/current-theme.conf|colors\.[a-z]+|\.uuid$'

# get number of unstaged changes (excluding ignored files)
unstaged=$(git diff --numstat | grep -v -E "$IGNORE_FILES" | wc -l)

# get the list of files with unstaged changes (excluding ignored files)
unstaged_files=($(git diff --name-only | grep -v -E "$IGNORE_FILES"))

# set status var which will be used to display in waybar
if [[ $unstaged -gt 0 ]]; then
  status="$unstaged"
else
  status="Clean"
fi

# tooltip to display which files were changed
tooltip="Files to Push:"
for file in "${unstaged_files[@]}"; do
  tooltip+="\n$file"
done

# escape double quotes in JSON
tooltip=$(echo "$tooltip" | sed 's/"/\\"/g')

# output for Waybar
echo "{\"text\": \"$status\", \"tooltip\": \"$tooltip\"}"

