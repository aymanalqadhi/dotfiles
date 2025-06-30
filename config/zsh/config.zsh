HISTFILE="${ZDOTDIR:-$HOME}/${ZHISTFILE:-.zsh_history}"
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

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

# keymaps
zmodload zsh/complist

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

## fix delete key
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

## completion menu
bindkey '^ '                 expand-or-complete-prefix
bindkey -M menuselect '^y'   accept-line
bindkey -M menuselect '^o'   accept-and-infer-next-history
bindkey -M menuselect '^e'   send-break
bindkey -M menuselect '^n'   menu-complete
bindkey -M menuselect '^p'   reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect '^s'   history-incremental-search-forward
bindkey -M menuselect '^r'   history-incremental-search-backward

## vi-mode
update_vimode_keymaps() {
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search

  ## history search
  bindkey -M viins '^s' history-incremental-pattern-search-backward
  bindkey -M viins '^r' history-incremental-pattern-search-forward
  bindkey -M vicmd '?'  history-incremental-pattern-search-backward
  bindkey -M vicmd '/'  history-incremental-pattern-search-forward

  ## menu items selection
  bindkey -M viins '^p' up-line-or-beginning-search
  bindkey -M viins '^n' down-line-or-beginning-search
  bindkey -M vicmd 'k'  up-line-or-beginning-search
  bindkey -M vicmd 'j'  down-line-or-beginning-search

  ## moving
  bindkey -M viins '^A' beginning-of-line
  bindkey -M viins '^E' end-of-line
  bindkey -M viins '^B' backward-char
  bindkey -M viins '^F' forward-char
}

update_vimode_keymaps

# vim: ft=zsh sw=2 ts=2 et
