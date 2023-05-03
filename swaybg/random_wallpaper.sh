#!/bin/sh
pkill swaybg
WALLPAPER_FOLDER=~/Desktop/Wallpapers/Default/
NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -type f | shuf -n1)
echo $NEXT_WALLPAPER
swaybg -i $NEXT_WALLPAPER -m fill &
OLD_PID=$!
while true; do
    sleep 300
    NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -type f | shuf -n1)
    swaybg -i $NEXT_WALLPAPER -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done

