#!/bin/bash

swayidle -w \
  timeout 15 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &

WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
$GL_FLAGS swaylock-plugin -d --command \
  "$WALLPAPER_COMMAND" \
  > ~/.local/state/swaylock-plugin.log 2>&1

pkill --newest swaylock-plugin -SIGUSR1
pkill --newest swayidle

