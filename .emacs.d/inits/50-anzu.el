(use-package anzu
  :diminish anzu-mode
  :bind (("M-%"   . anzu-query-replace)
	 ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))
