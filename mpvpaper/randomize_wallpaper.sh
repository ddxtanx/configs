#!/bin/bash
NEXT_WALLPAPER=$(~/.config/generate_wallpaper.sh)
MPV_PIDS=$(pgrep -f "mpvpaper -vv") #-vv is important, as it makes sure only wallpaper processes are kill
#I also run mpvpaper for the lockscreen, and those commands are not called with -vv
NEXT_PID=$!
COMMAND=$($HOME/.config/wallpaper_display_command.sh $NEXT_WALLPAPER)
echo $COMMAND
eval $COMMAND
kill $MPV_PIDS
pkill -f wallpaper_daemon -SIGUSR1

