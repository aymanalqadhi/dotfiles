# ls
alias ls="lsd"
alias ll='ls -l'
alias la='ls -la'
alias ldot='ls -ld .*'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'

# html encode/decode
alias htmldecode="perl -MHTML::Entities -pe 'decode_entities($_);"
alias htmldecode="perl -MHTML::Entities -pe 'decode_entities($_);"

# fzf
alias f=fzf

# vim: ft=zsh sw=2 ts=2 et
