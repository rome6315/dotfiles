
#!/bin/bash

# Get repo updates
repo_updates=$(checkupdates 2>/dev/null)

# Get AUR updates using aura
aur_updates=$(aura -Au --dryrun 2>/dev/null)

# Prepare display strings
output=""

if [[ -n "$repo_updates" ]]; then
    output+="Repo Updates:\n$repo_updates\n"
fi

if [[ -n "$aur_updates" ]]; then
    output+="AUR Updates:\n$aur_updates"
fi

# Show appropriate Rofi menu
if [[ -z "$output" ]]; then
    echo "No updates available" | rofi -dmenu -p "Updates"
else
    echo -e "$output" | rofi -dmenu -p "Updates Available"
fi

