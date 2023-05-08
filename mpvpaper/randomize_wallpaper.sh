#!/bin/bash
WALLPAPER_FOLDER=~/Desktop/Wallpapers/Default/
NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -maxdepth 1 -iregex ".*\.\(jpg\|jpeg\|png\|gif\)" -printf "%p\n" | shuf | head -1)

OLD_PID=0
if [ ! -f $HOME/.config/mpvpaper/old_pid.pid ]; then
    mpvpaper -v -o "loop" "*" $NEXT_WALLPAPER &
    OLD_PID=$!
    echo "$OLD_PID" > $HOME/.config/mpvpaper/old_pid.pid
else
    OLD_PID=$(cat $HOME/.config/mpvpaper/old_pid.pid)
  
    mpvpaper -v -o "loop" "*" $NEXT_WALLPAPER &
    NEXT_PID=$!

    kill $OLD_PID

    echo "$NEXT_PID" > $HOME/.config/mpvpaper/old_pid.pid
fi
    

