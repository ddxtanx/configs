#!/bin/bash
echo "$(date) - idle.sh called" >> /home/ddxtanx/.local/state/idle.log
mkdir /home/ddxtanx/.local/state/idle.lock || exit 1
echo "$(date) - idle.sh started" >> /home/ddxtanx/.local/state/idle.log
swayidle -w \
         timeout 300 'daemonize $HOME/.config/sway/generate_lockscreen.sh' \
         before-sleep 'daemonize $HOME/.config/sway/generate_lockscreen.sh' >> /home/ddxtanx/.local/state/idle.log 2>&1 
trap "rm -rf /home/ddxtanx/.local/state/idle.lock" EXIT
rmdir /home/ddxtanx/.local/state/idle.lock
