#!/bin/bash
MONITOR=$(~/.config/get_monitor.sh)
mkdir ~/.local/state/lockscreen.lock || exit 1

pkill -f "idle.sh"
rm -rf ~/.local/state/idle.lock
pkill -f "swayidle"

echo "$(date) - Lockscreen" >> ~/.local/state/lockscreen.log
swayidle timeout 15 '/usr/bin/swaymsg "output * dpms off"' resume '/usr/bin/swaymsg "output * dpms on"' >> ~/.local/state/idle.log 2>&1 &
DPMS_PID=$!

WALLPAPER=$(~/.config/generate_wallpaper.sh)

~/.config/sway/create_lockscreen.sh "$WALLPAPER"

kill $DPMS_PID
~/.config/sway/idle.sh &
rmdir ~/.local/state/lockscreen.lock
