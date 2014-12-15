(use-package sh-script
  :defer t
  :config
  (defun set-sh-mode-indent ()
    (setq sh-basic-offset 2)
    (setq sh-indentation 2))
  (add-hook 'sh-mode-hook 'set-sh-mode-indent))
