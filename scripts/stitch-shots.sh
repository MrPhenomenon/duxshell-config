#!/bin/bash

dir="${XDG_RUNTIME_DIR:-/tmp}/stitch-shots"
out_dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir" "$out_dir"

case "$1" in
    add)
        pgrep -x slurp >/dev/null && exit 0
        geo=$(slurp) || exit 0
        grim -g "$geo" "$dir/$(date +%s%N).png"
        count=$(find "$dir" -name '*.png' | wc -l)
        notify-send -a Screenshot "Capture added" "$count in queue"
        ;;
    done)
        shots=("$dir"/*.png)
        if [ ! -e "${shots[0]}" ]; then
            notify-send -a Screenshot "Nothing to stitch" "Queue is empty"
            exit 0
        fi
        direction=-append
        [ "$2" = "h" ] && direction=+append
        final="$out_dir/stitch_$(date +%Y%m%d-%H%M%S).png"
        bg=$(for f in "${shots[@]}"; do
            magick "$f" -alpha off -scale 50% -format %c histogram:info:-
        done | awk '{c=$1; sub(":","",c); if (match($0,/#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/)) n[substr($0,RSTART,7)]+=c} END {for (k in n) print n[k], k}' | sort -rn | head -1 | cut -d' ' -f2)
        magick -background "${bg:-white}" -gravity center "${shots[@]}" $direction "$final" || exit 1
        wl-copy --type image/png < "$final"
        rm -f "$dir"/*.png
        notify-send -a Screenshot "Stitched ${#shots[@]} captures" "Saved and copied: $(basename "$final")"
        ;;
    clear)
        rm -f "$dir"/*.png
        notify-send -a Screenshot "Queue cleared" "Discarded pending captures"
        ;;
esac
