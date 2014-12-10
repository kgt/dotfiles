;; -----------------------------------------------------------------------------
;; cask
;; -----------------------------------------------------------------------------

(if (require 'cask nil t)
    (cask-initialize))

;; -----------------------------------------------------------------------------
;; use-package
;; -----------------------------------------------------------------------------

(unless (require 'use-package nil t)
  (display-warning 'init "use-package is not installed")
  (defmacro use-package (&rest args)))

;; -----------------------------------------------------------------------------
;; init-loader
;; -----------------------------------------------------------------------------

(if (fboundp 'init-loader-load)
    (progn
      (setq init-loader-show-log-after-init 'error-only)
      (init-loader-load)))
