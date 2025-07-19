# mpd vars
export MPD_PID="${XDG_RUNTIME_DIR}/mpd.pid"
export MPD_HOST="${XDG_RUNTIME_DIR}/mpd.socket"
# autostart X
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# vim: ft=zsh sw=2 ts=2 et
