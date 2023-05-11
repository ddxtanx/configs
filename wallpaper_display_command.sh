#!/bin/bash
NEXT_WALLPAPER=$1
MONITOR=$($HOME/.config/get_monitor.sh)
echo "$GL_FLAGS mpvpaper \
  -vv -p -o \"hwdec=auto loop hwdec-codecs=all vo=gpu-next\" \
  \"$MONITOR\" $NEXT_WALLPAPER &"

