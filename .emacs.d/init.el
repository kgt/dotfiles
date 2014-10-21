;; -----------------------------------------------------------------------------
;; package
;; -----------------------------------------------------------------------------

(if (fboundp 'package-initialize)
    (progn
      (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
			       ("melpa" . "http://melpa.milkbox.net/packages/")))
      (package-initialize)))

;; -----------------------------------------------------------------------------
;; init-loader
;; -----------------------------------------------------------------------------

(if (fboundp 'init-loader-load)
    (progn
      (setq init-loader-show-log-after-init 'error-only)
      (init-loader-load)))
