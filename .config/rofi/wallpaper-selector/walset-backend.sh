#!/bin/bash

# check if argument was provided (debugging)
if [ "$#" -ne 1 ]; then 
    echo "Usage: $0 <path_to_image>"
    exit 1
fi

IMAGE="$1" # set wallpaper to IMAGE variable

matugen image "$IMAGE" # generate colors and apply to apps

notify-send -t 3000 "Wallpaper Changed and Theme Applied!"