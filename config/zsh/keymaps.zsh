KEYTIMEOUT=1
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# use terminfo to define keys
zmodload zsh/terminfo || return 1
zmodload zsh/complist || return 1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

typeset -g -A key

key=(
  # Basic keys
  [Home]="${terminfo[khome]:-$'\e[H'}"
  [End]="${terminfo[kend]:-$'\e[F'}"
  [Insert]="${terminfo[kich1]:-$'\e[2~'}"
  [Backspace]="${terminfo[kbs]:-$'\x7f'}"
  [Delete]="${terminfo[kdch1]:-$'\e[3~'}"
  [Up]="${terminfo[kcuu1]:-$'\e[A'}"
  [Down]="${terminfo[kcud1]:-$'\e[B'}"
  [Left]="${terminfo[kcub1]:-$'\e[D'}"
  [Right]="${terminfo[kcuf1]:-$'\e[C'}"
  [PageUp]="${terminfo[kpp]:-$'\e[5~'}"
  [PageDown]="${terminfo[knp]:-$'\e[6~'}"

  # Modified keys
  [Shift-Tab]="${terminfo[kcbt]:-$'\e[Z'}"
  [Control-Left]="${terminfo[kLFT5]:-$'\e[1;5D'}"
  [Control-Right]="${terminfo[kRIT5]:-$'\e[1;5C'}"
)

bindkey_if_set() { [[ -n $1 ]] && bindkey -- "$1" "$2"; }

# basic keymaps
bindkey_if_set "${key[Home]}"          beginning-of-line
bindkey_if_set "${key[End]}"           end-of-line
bindkey_if_set "${key[Insert]}"        overwrite-mode
bindkey_if_set "${key[Backspace]}"     backward-delete-char
bindkey_if_set "${key[Delete]}"        delete-char
bindkey_if_set "${key[Up]}"            up-line-or-beginning-search
bindkey_if_set "${key[Down]}"          down-line-or-beginning-search
bindkey_if_set "${key[Left]}"          backward-char
bindkey_if_set "${key[Right]}"         forward-char
bindkey_if_set "${key[PageUp]}"        beginning-of-buffer-or-history
bindkey_if_set "${key[PageDown]}"      end-of-buffer-or-history
bindkey_if_set "${key[Shift-Tab]}"     reverse-menu-complete
bindkey_if_set "${key[Control-Left]}"  backward-word
bindkey_if_set "${key[Control-Right]}" forward-word

# completion
bindkey '^ '                  expand-or-complete-prefix
bindkey -M menuselect '^y'    accept-line
bindkey -M menuselect '^o'    accept-and-infer-next-history
bindkey -M menuselect '^e'    send-break
bindkey -M menuselect '^n'    menu-complete
bindkey -M menuselect '^p'    reverse-menu-complete
bindkey -M menuselect $'\e[Z' reverse-menu-complete
bindkey -M menuselect '^S'    history-incremental-search-forward
bindkey -M menuselect '^R'    history-incremental-search-backward

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
if [ -n "${terminfo[smkx]:-}" ] && [ -n "${terminfo[rmkx]:-}" ]; then
  autoload -Uz add-zle-hook-widget

  zle_application_mode_start() {
    echoti smkx;
  }
  zle_application_mode_stop() {
    echoti rmkx;
  }

  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# vim: ft=zsh sw=2 ts=2 et
