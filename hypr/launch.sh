#!/bin/sh

cd ~

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Unity
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export MOZ_ENABLE_WAYLAND=1

export STEAM_FORCE_DESKTOPUI_SCALING=1.33
export GDK_DPI_SCALE=1.33

exec dbus-launch Hyprland > ~/hypr.log
