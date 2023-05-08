#!/bin/sh
WALLPAPER_FOLDER=~/Desktop/Wallpapers/Default/
NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -maxdepth 1 -iregex ".*\.\(jpg\|jpeg\|png\|gif\)" -printf "%p\n" | shuf | head -1)
swww img $NEXT_WALLPAPER --transition-type random

