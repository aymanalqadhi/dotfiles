# default permissions
umask 027

# locale
export LANG="${LANG:-en_US.UTF-8}"

# XDG paths
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

if [ -f "${XDG_CONFIG_HOME}/user-dirs.dirs" ]; then
  set -a && . "${XDG_CONFIG_HOME}/user-dirs.dirs"; set +a
fi

# config directory
export ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}

# editor/pager
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export LESS="${LESS:--g -i -M -R -w --use-color}"

# paths
typeset -U path PATH
typeset -U fpath FPATH

# local binaries
path+=($HOME/.local/{bin,scripts})

# completion scripts
fpath+=(${XDG_CONFIG_HOME}/zsh/comp)

# vim: ft=zsh sw=2 ts=2 et
