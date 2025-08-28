#!/bin/sh

while [ -f "$MPD_PID" ]; do
    mpc current |
        xargs -d'\n' basename 2>/dev/null |
        cut -d. -f1 |
        fribidi --nopad || break

    mpc idle player >/dev/null 2>&1 || break
done
