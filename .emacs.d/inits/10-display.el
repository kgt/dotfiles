(setq default-frame-alist (append '((width          . 80)
				    (height         . 47)
				    (tool-bar-lines . nil)
				    (alpha          . 90))
				  (cond ((eq system-type 'windows-nt)
					 '((font . "Consolas-10")))
					((eq system-type 'darwin)
					 '((font . "Andale Mono-12"))))
				  default-frame-alist))

(line-number-mode t)
(column-number-mode t)

(transient-mark-mode 0)