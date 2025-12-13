typeset -U PATH path

() {
  local rbenv_path
  if [[ -x ~/.rbenv/bin/rbenv ]]; then
    rbenv_path=~/.rbenv/bin/rbenv
  elif type rbenv > /dev/null; then
    rbenv_path=rbenv
  fi
  if [[ -n $rbenv_path ]]; then
    eval "$($rbenv_path init - --no-rehash zsh)"
  fi
}
