#!/bin/bash


WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
SWAYLOCKS=$(pgrep swaylock-plugin)
NUM_SWAYLOCKS=$(echo $SWAYLOCKS | wc -w)
LOCK_COMMAND="$GL_FLAGS swaylock-plugin -d --command \
  '$WALLPAPER_COMMAND' \
  >> ~/.local/state/swaylock-plugin.log 2>&1"

if [ $NUM_SWAYLOCKS -eq 0 ]; then
  echo $LOCK_COMMAND
  swayidle -w \
    timeout 15 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
  SWAYIDLE_PID=$!
  eval $LOCK_COMMAND
  kill $SWAYIDLE_PID
fi

