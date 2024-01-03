#!/bin/bash
exec 120>~/.local/state/swaylock-plugin.lock
flock -n 120 || exit 1

trap "rm -f ~/.local/state/swaylock-plugin.lock" EXIT

WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

swayidle timeout 15 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' >> ~/.local/state/swaylock-plugin.log 2>&1 &
SWAYIDLE_PID=$!

$HOME/.config/sway/create_lockscreen.sh "$WALLPAPER" $SWAYIDLE_PID >> ~/.local/state/swaylock-plugin.log 2>&1
