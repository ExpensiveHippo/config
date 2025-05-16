#!/bin/sh

# Pick random png
img="$(find ~/Pictures -type f -name "*.png" | shuf -n1)"
echo $img

# Fade in new wallpaper
swww img $img
