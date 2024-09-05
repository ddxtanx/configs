#!/bin/bash
NEXT_WALLPAPER=$1
MONITOR=$($HOME/.config/get_monitor.sh)
echo "$GL_FLAGS mpvpaper \
  -p -o \"loop hwdec=vaapi vo=gpu gpu-context=wayland profile=fast\" \
  \"$MONITOR\" $NEXT_WALLPAPER &"

