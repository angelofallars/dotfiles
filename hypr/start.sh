#!/usr/bin/sh

nmcli connection up ZTE_2.4G_7mCk6c &

start_pipewire () {
    /usr/bin/pipewire &
    /usr/bin/pipewire-pulse &
    /usr/bin/wireplumber &
}

start_audio () {
    start_pipewire
    sleep 5
    XDG_CURRENT_DESKTOP=Unity waybar &
    nm-applet --indicator &
    blueman-applet &
    sleep 5
    bluetoothctl connect 78:2B:64:38:36:17 &
}

dunst &

start_audio &

mkfifo /tmp/wob_audio ; tail -f /tmp/wob_audio | wob &
