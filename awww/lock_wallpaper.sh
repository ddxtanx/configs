#!/bin/sh
# lock_wallpaper.sh
rm /run/user/1000/wayland-0-awww-daemon.lock.sock
$HOME/.local/bin/awww-daemon -n lock &
DAEMON_PID=$!
sleep 0.5
$HOME/.local/bin/awww img -n lock -t random "$1" 
wait "$DAEMON_PID"
