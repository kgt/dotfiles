(use-package helm
  :demand t
  :diminish helm-mode
  :bind (("M-x"     . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config
  (helm-mode))
