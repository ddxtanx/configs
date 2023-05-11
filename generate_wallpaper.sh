#!/bin/sh

RANDOM_WALLPAPER=
WALLPAPER_FOLDER=~/Desktop/Wallpapers/Default/
NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -maxdepth 1 -iregex ".*\.\(jpg\|jpeg\|png\|gif\|mp4\)" -printf "%p\n" | shuf | head -1)

echo $NEXT_WALLPAPER
