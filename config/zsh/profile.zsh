# locale
export LANG="${LANG:-en_US.UTF-8}"

# editor/pager
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export LESS="${LESS:--g -i -M -R -w -z-4 --use-color}"

# mpd vars
export MPD_PID="${XDG_RUNTIME_DIR}/mpd.pid"
export MPD_HOST="${XDG_RUNTIME_DIR}/mpd.socket"

# load theme (if exists)
[ -f "$ZDOTDIR/theme.zsh" ] && . "$ZDOTDIR/theme.zsh"

# go
export GOPATH="$HOME/go"
path+=("$GOPATH/bin")

# rust
export CARGO_HOME="$HOME/.cargo"
path+=("$CARGO_HOME/bin")

# autostart X
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# vim: ft=zsh sw=2 ts=2 et
