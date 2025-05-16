#!/bin/bash

region=$(slurp)

# Exit silently if slurp was cancelled
[ -z "$region" ] && exit 0

grim -g "$region" - | wl-copy
notify-send "Screenshot copied to clipboard"
