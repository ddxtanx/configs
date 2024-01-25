#!/bin/bash
echo "kill swayidle"
pkill -f "swayidle -w timeout 600"
echo "killed swayidle"

echo "launching new swayidle"
swayidle timeout 15 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' >> ~/.local/state/swaylock-plugin.log 2>&1 &
SWAYIDLE_PID=$!
echo "swayidle launched"

echo "obtaining lock"
exec 120>~/.local/state/swaylock-plugin.lock
flock -n 120 || exit 1
echo "lock obtained"cho 

trap "rm -f ~/.local/state/swaylock-plugin.lock" EXIT

WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)


echo "creating lockscreen"
$HOME/.config/sway/create_lockscreen.sh "$WALLPAPER" $SWAYIDLE_PID >> ~/.local/state/swaylock-plugin.log 2>&1
echo "created lockscreen"
echo "creating new swayidle"
swayidle -w \
         timeout 600 '$HOME/.config/sway/generate_lockscreen.sh' \
         before-sleep '$HOME/.config/sway/generate_lockscreen.sh' >> ~/.local/state/swaylock-plugin.log 2>&1 &
flock -u 120
echo "created new swayidle"
