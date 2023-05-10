#!/bin/bash

NEXT_TIME=0
WALLPAPER_TIME=300

increase_wait() {
    if [ $SLEEP_PID -ne -1 ]; then
        kill -9 $SLEEP_PID
    fi
    CUR_TIME=$(date +%s)
    NEXT_TIME=$((CUR_TIME + $WALLPAPER_TIME))
}

trap increase_wait SIGUSR1

increase_wait
SLEEP_PID=-1

while true; do
    $HOME/.config/mpvpaper/randomize_wallpaper.sh
    while [ $(date +%s) -lt $NEXT_TIME ]; do
        SLEEP_FOR=$((NEXT_TIME - $(date +%s)))
        sleep $SLEEP_FOR &
        SLEEP_PID=$!
        wait $SLEEP_PID
    done
done
