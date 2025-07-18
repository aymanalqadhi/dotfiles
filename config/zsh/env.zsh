# globals
typeset -U path PATH
typeset -g -A key

# zsh options
KEYTIMEOUT=1
ZLS_COLORS=$LS_COLORS
skip_global_compinit=1

# locale
export LANG="${LANG:-en_US.UTF-8}"

# XDG paths
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:/run/user/$UID}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# zsh init path
export ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}

# text
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export LESS="${LESS:--g -i -M -R -w -z-4 --use-color}"

if [ -z "$PAGER" ] && which bat 2>&1 >/dev/null; then
  export PAGER="bat"
  export MANPAGER="bat --language=man --strip-ansi=always --style=plain"
fi

# runsvdir
export SVDIR="$HOME/.local/service"

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# rust
export CARGO_HOME="$HOME/.cargo"
export CARGO_TARGET_DIR=$CARGO_HOME/target

# node
export NODE_HOME="/opt/node-v18"

# pure prompt
export PURE_CMD_MAX_EXEC_TIME=10
export PURE_GIT_PULL=0

# path
path=(
  # system binaries
  /bin
  /sbin
  /usr/bin
  /usr/sbin

  # local paths
  $HOME/.local/{sbin,bin{,/platform-tools},scripts,share/bob/nvim-bin}

  # rust paths
  $CARGO_HOME/bin

  # go
  $GOBIN

  # node
  $NODE_HOME/bin

  # original path value
  $path
)

# functions path
fpath=($XDG_CONFIG_HOME/zsh/comp $fpath)

# keys
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# vim: ft=zsh sw=2 ts=2 et
