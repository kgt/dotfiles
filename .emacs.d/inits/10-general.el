(prefer-coding-system 'utf-8)

(custom-set-variables '(make-backup-files nil)
		      '(inhibit-startup-message t)
		      '(initial-scratch-message nil)
		      '(custom-file (locate-user-emacs-file "custom.el")))

(fset 'yes-or-no-p 'y-or-n-p)
