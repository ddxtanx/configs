#!/bin/bash

#Called like this: create_lockscreen.sh [path]
WALLPAPER=$1

WALLPAPER_COMMAND=$($HOME/.config/wallpaper_display_command.sh $WALLPAPER)
LOCK_COMMAND="$GL_FLAGS swaylock-plugin -e -l --command '$WALLPAPER_COMMAND' >> ~/.local/state/lockscreen.log 2>&1" 

eval $LOCK_COMMAND

