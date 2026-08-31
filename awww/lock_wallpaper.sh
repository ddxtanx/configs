#!/bin/sh
# lock_wallpaper.sh
rm /run/user/1000/wayland-0-awww-daemon.lock.sock
awww-daemon -n lock &
DAEMON_PID=$!
sleep 0.5
awww img -n lock -t random "$1" 
wait "$DAEMON_PID"
