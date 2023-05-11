#!/bin/bash

swayidle -w \
  timeout 15 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &

WALLPAPER_DIR=$HOME/Desktop/Wallpapers/Default/
WALLPAPER=$(~/.config/generate_wallpaper.sh)

MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330 swaylock-plugin -d --command "mpvpaper -v -o 'hwdec=auto loop hwdec-codecs=all vo=gpu-next' '*' $WALLPAPER" > ~/.local/state/swaylock-plugin.log 2>&1

pkill --newest swaylock-plugin -SIGKILL
pkill --newest swayidle

