#!/bin/bash

swayidle -w \
  timeout 15 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &

WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
LOCK_COMMAND="$GL_FLAGS swaylock-plugin -d --command \
  '$WALLPAPER_COMMAND' \
  > ~/.local/state/swaylock-plugin.log 2>&1"

echo $LOCK_COMMAND
eval $LOCK_COMMAND

pkill --newest swaylock-plugin -SIGKILL
pkill --newest swayidle

