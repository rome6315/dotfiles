#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme "$1" # set gtk theme
gsettings set org.gnome.desktop.interface icon-theme "$1" # set icon theme
#FIGURE OUT QT THEMES AND HOW TO SET HERE
