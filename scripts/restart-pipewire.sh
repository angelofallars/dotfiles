#!/bin/zsh
killall pipewire pipewire-pulse wireplumber
pipewire & disown
pipewire-pulse & disown
wireplumber & disown
