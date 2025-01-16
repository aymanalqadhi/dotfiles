#!/bin/sh

trap "exit" INT TERM
trap "kill 0" EXIT

current_id=
current_pid=

xprop -spy -root 32x '\t$0\n' _NET_ACTIVE_WINDOW \
    | while read _ id; do
          # skip redundant work
          [ "$id" = "$current_id" ] || [ "$id" = ""] && continue;

          # kill current watcher (if any)
          [ -n "$current_pid" ] && kill -9 $current_pid

          # if no window is active, print fallback
          [ "$id" = "0x0" ] && echo && continue;

          xprop -spy -id $id _NET_WM_NAME \
               | sed -uE 's/^.*= "(.*)"$/\1/g' \
               | stdbuf -oL fribidi --ltr --nopad --nobreak &

          current_pid=$!
          current_id=$id
      done;
