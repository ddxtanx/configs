#!/bin/bash
WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(find $WALLPAPER_DIR -maxdepth 1 -iregex '.*\.\(png\|jpg\|jpeg\|gif\)' -printf "%p\n" | shuf | head -1)

MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330 swaylock-plugin --command "mpvpaper -v -f -o 'loop' '*' $WALLPAPER" > ~/.local/state/swaylock-plugin.log 2>&1

