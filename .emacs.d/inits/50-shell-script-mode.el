(use-package sh-script
  :defer t
  :config
  (defun sh-mode-hook-indent ()
    (setq sh-basic-offset 2)
    (setq sh-indentation 2))
  (add-hook 'sh-mode-hook 'sh-mode-hook-indent))
