#!/bin/bash

sudo install -vm755 start-sway /usr/local/bin/
sudo install -vm644 sway.desktop /usr/share/wayland-sessions/

# if start-sway_machine_specific_configurations exists, install it
if [ -f start-sway_machine_specific_configurations ]; then
    sudo install -vm755 start-sway_machine_specific_configurations /usr/local/bin/
fi
