########## general ##########

WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# options
setopt extended_glob
setopt no_beep
setopt no_hist_beep

########## completion ##########

autoload -Uz compinit && compinit

# options
setopt complete_in_word    # Complete from both ends of a word.
setopt always_to_end       # Move cursor to the end of a completed word.
setopt auto_menu           # Show completion menu on a successive tab press.
setopt auto_list           # Automatically list choices on ambiguous completion.
setopt auto_param_slash    # If completed parameter is a directory, add a trailing slash.
setopt extended_glob       # Needed for file modification glob modifiers with compinit
unsetopt menu_complete     # Do not autoselect the first completion entry.
unsetopt flow_control      # Disable start/stop characters in shell editor.

# style

## base
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete true

## caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

## menu
zstyle ':completion:*' menu select search
zstyle ':completion:*' file-sort change reverse

## formatting
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

## grouping
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

## behavior
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

########## history ##########

# config
HISTFILE="${ZDOTDIR:-$HOME}/${ZHISTFILE:-.zsh_history}"
HISTSIZE=10000
SAVEHIST=10000

# options
setopt bang_hist              # Treat the '!' character specially during expansion.
setopt extended_history       # Write the history file in the ':start:elapsed;command' format.
setopt inc_append_history     # Write to the history file immediately, not when the shell exits.
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups       # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups   # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt hist_beep              # Beep when accessing non-existent history.

# keymaps
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward

bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

########## prompt ##########

autoload -Uz promptinit && promptinit
