#!/usr/bin/bash

base_dir=$(cd $(dirname $0) && pwd)
files=(
  .emacs.d/init.el
  .tmux.conf
  .zprofile
  .zshrc
)

for f in ${files[@]}; do
  if [ ! -e ~/$f ]; then
    echo "Install $f"
    mkdir -p $(dirname ~/$f)
    ln -s $base_dir/$f ~/$f
  else
    echo "Skip $f"
  fi
done
