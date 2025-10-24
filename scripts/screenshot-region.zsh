dir="$HOME/Pictures/screenshots"
file="$dir/screenshot-$(date '+%Y-%m-%d_%H-%M-%S').png"

mkdir -p $dir

area=$(slurp)

if [[ -n $area ]]; then
    exec grim -g "$area" - | tee $file | wl-copy
    notify-send "Screenshot saved to '$file'"
fi


