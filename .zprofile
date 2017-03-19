typeset -U PATH path

if whence rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi
