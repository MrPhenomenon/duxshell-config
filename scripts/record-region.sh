#!/bin/bash

dir="$HOME/Videos/Recordings"
mkdir -p "$dir"

if pgrep -f gpu-screen-recorder >/dev/null; then
    pkill -INT -f gpu-screen-recorder
    notify-send -a Recorder "Recording stopped" "Processing..."
else
    geo=$(slurp -f "%wx%h+%x+%y") || exit 0
    ts=$(date +%Y%m%d-%H%M%S)
    raw="$dir/.rec_${ts}.mp4"
    final="$dir/rec_${ts}.mp4"
    notify-send -a Recorder "Recording started" "Region capture"
    gpu-screen-recorder -w region -region "$geo" -f 60 -k h264 -ac aac -cr limited -q very_high -bm qp -a default_output -cursor yes -o "$raw"
    ffmpeg -y -i "$raw" -c copy -movflags +faststart "$final" && rm -f "$raw"
    notify-send -a Recorder "Recording saved" "Ready to upload: $(basename "$final")"
fi
