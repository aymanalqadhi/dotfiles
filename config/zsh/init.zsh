# default permissions
umask 027

# load antidote
zstyle ':antidote:bundle' file $ZDOTDIR/plugins.txt
source $ZDOTDIR/antidote/antidote.zsh && antidote load

# source configuration files
source $ZDOTDIR/config.zsh
source $ZDOTDIR/aliases.zsh

# prompt
prompt pure

# fortune cookies
fortune 2>/dev/null || true

# vim: ft=zsh sw=2 ts=2 et
