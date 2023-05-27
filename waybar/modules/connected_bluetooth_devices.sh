#!/bin/bash

bluetoothctl devices Connected | cut -f2 -d' ' | while read uuid; do echo $(bluetoothctl info $uuid | grep -B10 -e 'Connected: yes' | grep 'Device' | cut -f2 -d' ' | head -n1); done
