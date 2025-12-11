typeset -U PATH path

if type rbenv > /dev/null; then
  eval "$(rbenv init - --no-rehash zsh)"
fi
