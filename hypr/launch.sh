#!/bin/sh

cd ~

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Unity
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export MOZ_ENABLE_WAYLAND=1

exec dbus-launch Hyprland
