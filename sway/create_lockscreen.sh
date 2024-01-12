#!/bin/bash

#Called like this: create_lockscreen.sh [path] [swayidle_pid]
WALLPAPER=$1
SWAYIDLE_PID=$2

trap "kill -9 $SWAYIDLE_PID" EXIT

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
LOCK_COMMAND="$GL_FLAGS swaylock-plugin -e -l --command '$WALLPAPER_COMMAND'" 

echo $LOCK_COMMAND 
eval $LOCK_COMMAND
