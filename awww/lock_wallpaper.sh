#!/bin/sh
# lock_wallpaper.sh
SOCKET="${XDG_RUNTIME_DIR:-/run/user/$(id - u)}/${WAYLAND_DISPLAY:-wayland-0}-awww-daemon.lock.sock"
rm -f "$SOCKET"
awww-daemon -n lock --no-cache &
DAEMON_PID=$!
for _ in $(seq 1 30); do
    [ -S "$SOCKET" ] && break
    sleep 0.1
done
if [ ! -S "$SOCKET" ]; then
    echo "awww-daemon failed to start" >&2
    kill "$DAEMON_PID" 2>/dev/null
    exit 1
fi
awww img -n lock --resize fit "$1" 
wait "$DAEMON_PID"
