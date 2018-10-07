(setq default-frame-alist
      `((width          . 80)
	(height         . 47)
	(tool-bar-lines . nil)
	(alpha          . 90)
	,@(cond ((eq system-type 'windows-nt)
		 '((font . "Consolas-10")))
		((eq system-type 'darwin)
		 '((font . "Menlo-12")))
		((eq system-type 'gnu/linux)
		 '((font . "Monospace-10"))))))

(let ((mode 'dark))
  (set-frame-parameter nil 'background-mode mode)
  (set-terminal-parameter nil 'background-mode mode))

(line-number-mode t)
(column-number-mode t)

(custom-set-variables '(display-time-24hr-format t)
		      '(display-time-default-load-average nil))
(display-time-mode)

(transient-mark-mode 0)
