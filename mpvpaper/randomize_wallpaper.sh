#!/bin/bash
NEXT_WALLPAPER=$(~/.config/generate_wallpaper.sh)
MESA_FLAGS=MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330
MPV_PIDS=$(pgrep -f "mpvpaper -vv") #-vv is important, as it makes sure only wallpaper processes are kill
#I also run mpvpaper for the lockscreen, and those commands are not called with -vv
env $MESA_FLAGS mpvpaper -vv -p -o 'hwdec=auto loop hwdec-codecs=all vo=gpu-next' "*" $NEXT_WALLPAPER &
NEXT_PID=$!

kill $MPV_PIDS

