#!/bin/bash
mkdir ~/.local/state/idle.lock || exit 1
swayidle -w \
         timeout 600 '$HOME/.config/sway/generate_lockscreen.sh' \
         before-sleep '$HOME/.config/sway/generate_lockscreen.sh' >> ~/.local/state/idle.log 2>&1 
rmdir ~/.local/state/idle.lock
