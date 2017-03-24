(use-package auto-complete
  :demand t
  :diminish auto-complete-mode
  :init
  (custom-set-variables '(ac-ignore-case nil))
  :config
  (ac-config-default))
