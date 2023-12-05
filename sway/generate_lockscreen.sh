#!/bin/bash


WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

swayidle -w \
  timeout 15 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' &
SWAYIDLE_PID=$!

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
LOCK_COMMAND="$GL_FLAGS swaylock-plugin -d -e --command \
  '$WALLPAPER_COMMAND' \
  >> ~/.local/state/swaylock-plugin.log 2>&1 && trap 'kill -9 $SWAYIDLE_PID' EXIT"

exec 120>~/.local/state/swaylock-plugin.lock
flock -n 120 || exit 1
trap "rm -f ~/.local/state/swaylock-plugin.lock" EXIT

echo $LOCK_COMMAND
eval $LOCK_COMMAND
