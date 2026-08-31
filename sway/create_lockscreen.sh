#!/bin/bash

#Called like this: create_lockscreen.sh [path]
WALLPAPER=$1

WALLPAPER_COMMAND="/home/ddxtanx/.config/awww/lock_wallpaper.sh \"$WALLPAPER\""
echo "$(date) - $WALLPAPER_COMMAND" >> ~/.local/state/lockscreen.log

eval "$GL_FLAGS swaylock-plugin -e -l --color 00000000 --command \"$WALLPAPER_COMMAND\" >> ~/.local/state/lockscreen.log 2>&1"
PID1=$!

echo "PID2: $PID2" >> ~/.local/state/lockscreen.log
echo "Done." >> ~/.local/state/lockscreen.log


