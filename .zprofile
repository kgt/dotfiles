typeset -U PATH path

path=(
  ~/bin(N-/)
  ~/.anyenv/bin(N-/)
  $path
)

if whence anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi
