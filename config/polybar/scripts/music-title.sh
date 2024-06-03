#!/bin/sh

while true; do
  mpc current                           \
    | xargs -d'\n' basename 2>/dev/null \
    | cut -d. -f1                       \
    | fribidi --nopad || break

  # %{F#99AACC}
  mpc idle player > /dev/null 2>&1 || break
done
