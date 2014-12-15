(use-package ruby-mode
  :mode (("/Rakefile\\'"  . ruby-mode)
	 ("/Gemfile\\'"   . ruby-mode)
	 ("\\.gemspec\\'" . ruby-mode))
  :config
  (add-hook 'ruby-mode-hook 'show-paren-mode))
