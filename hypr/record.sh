#/usr/bin/env sh

# pidof wl-screenrec && killall wl-screenrec && notify-send Finished recording || wl-screenrec -g "$(slurp)" -f "video-$(date +%F_%R).mp4" & notify-send Started recording || notify-send wl-screenrec failed
if pidof wl-screenrec ; then
    killall -2 wl-screenrec
    notify-send "Finished recording"
    exit 0
fi

out="$(slurp)"

if [ $? != 0 ]; then
    exit
fi

filename="$HOME/Videos/screenrec/video-$(date +%F_%R).mp4"

wl-screenrec -g "$out" -f "$filename" --audio --audio-device bluez_output.78_2B_64_38_36_17.1.monitor &

if [ $? != 0 ]; then
    notify-send "Error starting recording"
    exit 1
fi

exit 0
