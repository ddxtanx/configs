#!/bin/bash
mkdir ~/.local/state/idle.lock || exit 1
swayidle -w \
         timeout 600 'daemonize $HOME/.config/sway/generate_lockscreen.sh' \
         before-sleep 'daemonize $HOME/.config/sway/generate_lockscreen.sh' >> ~/.local/state/idle.log 2>&1 
trap "rm -rf ~/.local/state/idle.lock" EXIT
rmdir ~/.local/state/idle.lock
