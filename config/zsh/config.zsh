# history config
HISTFILE="$ZDOTDIR/${ZHISTFILE:-.zsh_history}"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# options
setopt always_to_end
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt bang_hist
setopt complete_in_word
setopt extended_glob
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt interactive_comments
setopt menu_complete
setopt promptsubst
unsetopt beep
unsetopt hist_beep
unsetopt flow_control
unsetopt singlelinezle

# completion menu style
zstyle ':completion:*' completer _extensions _complete _match _approximate
zstyle ':completion:*' complete true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select search
zstyle ':completion:*' file-sort change reverse
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# vim: ft=zsh sw=2 ts=2 et
