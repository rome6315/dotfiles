#!/bin/bash

# run script to copy over new theme/style
~/.config/rofi/waybar-selector/waybar-selector.sh

# restart waybar to apply new theme/style
pkill -x waybar
sleep 0.5
waybar &