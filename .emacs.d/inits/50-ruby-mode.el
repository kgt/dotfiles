(if (fboundp 'ruby-mode)
    (dolist (regexp '("/Rakefile\\'"
		      "/Gemfile\\'"
		      "\\.gemspec\\'"))
      (add-to-list 'auto-mode-alist (cons regexp 'ruby-mode))))
