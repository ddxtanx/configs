#!/bin/bash

#Called like this: create_lockscreen.sh [path]
WALLPAPER=$1

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
echo "$(date) - $WALLPAPER_COMMAND" >> ~/.local/state/lockscreen.log

PID1=$GL_FLAGS swaylock-plugin -e -l --command "$WALLPAPER_COMMAND"
PID2=$!
echo "PID1: $PID1" >> ~/.local/state/lockscreen.log
echo "PID2: $PID2" >> ~/.local/state/lockscreen.log
echo "Done." >> ~/.local/state/lockscreen.log


