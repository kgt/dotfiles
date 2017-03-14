(when (member 'solarized (custom-available-themes))
       (let ((mode 'dark))
	 (set-frame-parameter nil 'background-mode mode)
	 (set-terminal-parameter nil 'background-mode mode))
       (load-theme 'solarized t))