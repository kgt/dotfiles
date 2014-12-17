(use-package lisp-mode
  :defer t
  :init
  (dolist (hook '(emacs-lisp-mode-hook
		  lisp-mode-hook
		  lisp-interaction-mode-hook))
    (add-hook hook 'show-paren-mode)))
