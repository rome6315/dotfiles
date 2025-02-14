#!/bin/bash

# Set the path to your Git repository
REPO_PATH="$HOME/dotfiles"

cd "$REPO_PATH"

# Ignore these files since all they do is change colors. no need to constantly push color changes
IGNORE_FILES='waybar/style.css|cava/config|dunst/dunstrc|hypr/scripts/set_wallpaper.sh|hypr/theme.conf|kitty/current-theme.conf|kitty/kitty.conf|kitty/kitty.conf.bak|nwg-dock-hyprland/theme.css|rofi/config.rasi|starship/starship.toml|scripts/theme-switcher/current_theme.txt'

# Check for staged changes
staged=$(git diff --cached --numstat | wc -l)

# Check for unstaged changes (excluding ignored files)
unstaged=$(git diff --numstat | grep -v -E "$IGNORE_FILES" | wc -l)

# Get the list of files with unstaged changes (excluding ignored files)
unstaged_files=($(git diff --name-only | grep -v -E "$IGNORE_FILES"))

# Build the status string
status=""

if [[ $unstaged -gt 0 && $staged -gt 0 ]]; then
  status+=" $unstaged unstaged  $staged staged" # If both staged and unstaged changes, only display each once
elif [[ $unstaged -gt 0 && $staged -eq 0 ]]; then
  status+=" $unstaged unstaged" # If only unstaged changes, don't display staged
elif [[ $unstaged -eq 0 && $staged -gt 0 ]]; then
  status+=" $staged staged" # If only staged changes, don't display unstaged
fi

# Default message if everything is clean
if [[ -z $status ]]; then
  status=" Clean"
fi

# Build tooltip content with newline-separated files
tooltip="Files to Push:"
for file in "${unstaged_files[@]}"; do
  tooltip+="\n$file"
done

# Escape double quotes in JSON
tooltip=$(echo "$tooltip" | sed 's/"/\\"/g')

# Output for Waybar
echo "{\"text\": \"$status\", \"tooltip\": \"$tooltip\"}"

