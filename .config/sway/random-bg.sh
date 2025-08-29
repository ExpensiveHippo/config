wallpaper=$(find ~/Pictures/wallpapers -type f | shuf -n 1)
pkill swaybg
swaybg -m fill -i "$wallpaper" &
