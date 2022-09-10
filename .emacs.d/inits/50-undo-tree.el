(use-package undo-tree
  :demand t
  :diminish undo-tree-mode
  :init
  (custom-set-variables '(undo-tree-auto-save-history nil))
  :config
  (global-undo-tree-mode))
