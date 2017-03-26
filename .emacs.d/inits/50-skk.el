(use-package skk
  :defer t
  :init
  (custom-set-variables
   '(default-input-method "japanese-skk")
   '(skk-server-host "localhost")
   '(skk-server-portnum 1178)
   '(skk-search-sagyo-henkaku t)
   '(skk-egg-like-newline t))
  (add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
  (add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup)
  :config
  (require 'skk-hint))
