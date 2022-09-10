(when (and window-system
	   (member 'solarized (custom-available-themes)))
  (load-theme 'solarized-dark t))
