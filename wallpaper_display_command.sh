#!/bin/bash
NEXT_WALLPAPER=$1
MONITOR=$($HOME/.config/get_monitor.sh)
echo "$GL_FLAGS mpvpaper \
  -vv -p -o \"loop hwdec=vaapi vo=gpu gpu-context=wayland\" \
  \"$MONITOR\" $NEXT_WALLPAPER &"

