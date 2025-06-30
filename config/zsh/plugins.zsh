# load plugin manager
declare -A ZINIT 
ZINIT=(
    [BIN_DIR]="$ZDOTDIR/zinit.git"
    [HOME_DIR]="$XDG_DATA_HOME/zinit"
)

source "${ZINIT[BIN_DIR]}/zinit.zsh"

# configure plugins

## zsh-vi-mode
zvm_after_init_commands+=('update_vimode_keymaps')

## zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# load plugins

## editor
zinit wait lucid light-mode for \
    jeffreytse/zsh-vi-mode      \
    hlissner/zsh-autopair       \
    rupa/z                      \
    unixorn/fzf-zsh-plugin      \

## completion
zinit wait lucid light-mode for                \
  atload"_zsh_autosuggest_start"               \
    zsh-users/zsh-autosuggestions              \
  blockf atpull'zinit creinstall -q .'         \
    zsh-users/zsh-completions                  \
  atload"zicompinit; zicdreplay"               \
    zdharma-continuum/fast-syntax-highlighting

## prompt
zinit light-mode for                         \
  compile'(pure|async).zsh'                  \
  pick'async.zsh'                            \
  src'pure.zsh'                              \
    sindresorhus/pure

# vim: ft=zsh sw=2 ts=2 et
