(defun make-show-paren-mode-buffer-local (&rest r)
  (make-variable-buffer-local 'show-paren-mode))

(advice-add 'show-paren-mode :before 'make-show-paren-mode-buffer-local)
