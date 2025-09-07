KEYTIMEOUT=1
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# use terminfo to define keys
zmodload zsh/terminfo
zmodload zsh/complist

autoload -Uz up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search && zle -N down-line-or-beginning-search

typeset -g -A key

key=(
  # basic
  [Home]="${terminfo[khome]}"
  [End]="${terminfo[kend]}"
  [Insert]="${terminfo[kich1]}"
  [Backspace]="${terminfo[kbs]-^?}"
  [Delete]="${terminfo[kdch1]-[[3~}"
  [Up]="${terminfo[kcuu1]}"
  [Down]="${terminfo[kcud1]}"
  [Left]="${terminfo[kcub1]}"
  [Right]="${terminfo[kcuf1]}"
  [PageUp]="${terminfo[kpp]}"
  [PageDown]="${terminfo[knp]}"
  # with modifiers
  [Shift-Tab]="${terminfo[kcbt]}"
  [Control-Left]="${terminfo[kLFT5]-\e[1;5D}"
  [Control-Right]="${terminfo[kRIT5]-\e[1;5C}"
)

# basic keymaps
bindkey -- "${key[Home]}"          beginning-of-line
bindkey -- "${key[End]}"           end-of-line
bindkey -- "${key[Insert]}"        overwrite-mode
bindkey -- "${key[Backspace]}"     backward-delete-char
bindkey -- "${key[Delete]}"        delete-char
bindkey -- "${key[Up]}"            up-line-or-beginning-search
bindkey -- "${key[Down]}"          down-line-or-beginning-search
bindkey -- "${key[Left]}"          backward-char
bindkey -- "${key[Right]}"         forward-char
bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
bindkey -- "${key[Control-Left]}"  backward-word
bindkey -- "${key[Control-Right]}" forward-word

# completion menu
bindkey '^ '                 expand-or-complete-prefix
bindkey -M menuselect '^y'   accept-line
bindkey -M menuselect '^o'   accept-and-infer-next-history
bindkey -M menuselect '^e'   send-break
bindkey -M menuselect '^n'   menu-complete
bindkey -M menuselect '^p'   reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect '^S'   history-incremental-search-forward
bindkey -M menuselect '^R'   history-incremental-search-backward

# vi-mode
## history search
bindkey -M viins '^S' history-incremental-pattern-search-backward
bindkey -M viins '^R' history-incremental-pattern-search-forward
bindkey -M vicmd '?'  history-incremental-pattern-search-backward
bindkey -M vicmd '/'  history-incremental-pattern-search-forward
## menu items selection
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search
bindkey -M vicmd 'k'  up-line-or-beginning-search
bindkey -M vicmd 'j'  down-line-or-beginning-search
## moving
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^F' forward-char
## editing
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^K' kill-line
bindkey -M viins '^U' backward-kill-line

# setup application mode
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# vim: ft=zsh sw=2 ts=2 et
