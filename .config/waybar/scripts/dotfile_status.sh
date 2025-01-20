#!/bin/bash


# Set the path to your Git repository
REPO_PATH="$HOME/dotfiles"


cd "$REPO_PATH"

# Get the current branch
branch=$(git symbolic-ref --short HEAD 2>/dev/null)


# ignore these files since all they do is change colors. no need to constantly push color changes
IGNORE_FILES='waybar/style.css|cava/config|dunst/dunstrc|hypr/scripts/set_wallpaper.sh|hypr/theme.conf|kitty/current-theme.conf|kitty/kitty.conf|kitty/kitty.conf.bak|nwg-dock-hyprland/theme.css|rofi/config.rasi|starship/starship.toml'


# Check for staged changes
staged=$(git diff --cached --numstat | wc -l)

# Check for unstaged changes (excluding ignored files)
unstaged=$(git diff --numstat | grep -v -E "$IGNORE_FILES" | wc -l)

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

# Output for Waybar
echo "{\"text\": \"$status\", \"tooltip\": \"Git Repository: $REPO_PATH - Branch: $branch\"}"

