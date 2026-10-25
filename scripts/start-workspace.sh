#!/bin/bash

launch() {
    if [ -n "$UWSM_WAIT_VARNAMES" ]; then
        uwsm app -- "$@"
    else
        "$@"
    fi
}

launch firefox &
launch kitty &
launch claude-desktop-unofficial &
launch code &
launch flatpak run com.spotify.Client &
launch filezilla &
launch dolphin &
launch kdeconnectd &
systemctl --user start hyprpolkitagent

sleep 4
hyprctl dispatch 'hl.dsp.focus({ workspace = "1" })'
