(use-package flymake-ruby
  :defer t
  :config
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))
