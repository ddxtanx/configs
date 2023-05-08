#!/bin/bash
WALLPAPER_FOLDER=~/Desktop/Wallpapers/Default/
NEXT_WALLPAPER=$(find $WALLPAPER_FOLDER -maxdepth 1 -iregex ".*\.\(jpg\|jpeg\|png\|gif\)" -printf "%p\n" | shuf | head -1)
MESA_FLAGS=MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330
MPV_PIDS=$(pgrep -x mpvpaper)
env $MESA_FLAGS mpvpaper -v -o "loop" "*" $NEXT_WALLPAPER &
NEXT_PID=$!

kill $MPV_PIDS

