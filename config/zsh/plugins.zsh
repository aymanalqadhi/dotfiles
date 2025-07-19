#
# plugin config
#

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# pure
PURE_CMD_MAX_EXEC_TIME=15
PURE_GIT_PULL=0

#
# load plugins
#

# load plugin manager
declare -A ZINIT 
ZINIT=(
  [BIN_DIR]="$ZDOTDIR/zinit.git"
  [HOME_DIR]="$XDG_DATA_HOME/zinit"
)
. "${ZINIT[BIN_DIR]}/zinit.zsh"

# editor
zinit wait lucid light-mode for \
    hlissner/zsh-autopair       \
    rupa/z                      \
    unixorn/fzf-zsh-plugin      \

# completion
zinit wait lucid light-mode for                  \
  atinit"zicompinit; zicdreplay"                 \
  wait'!'                                        \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start"                 \
      zsh-users/zsh-autosuggestions              \
  blockf atpull'zinit creinstall -q .'           \
      zsh-users/zsh-completions

# prompt
zinit light-mode for                         \
  compile'(pure|async).zsh'                  \
  pick'async.zsh'                            \
  src'pure.zsh'                              \
    sindresorhus/pure

# vim: ft=zsh sw=2 ts=2 et
