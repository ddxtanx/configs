#!/bin/bash
NEXT_WALLPAPER=$1
MONITOR=$($HOME/.config/get_monitor.sh)
echo "$GL_FLAGS mpvpaper \
  -p -o \"loop profile=gpu-hq vo=gpu-next hwdec=auto-copy target-colorspace-hint=yes\" \
  \"$MONITOR\" $NEXT_WALLPAPER &"

