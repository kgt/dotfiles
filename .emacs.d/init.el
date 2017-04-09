;; package

(custom-set-variables
 '(package-archives
   '(("gnu"   . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(anzu
     auto-complete
     color-theme-solarized
     ddskk
     exec-path-from-shell
     flycheck
     helm
     inf-ruby
     init-loader
     json-mode
     magit
     projectile
     ruby-end
     sass-mode
     slim-mode
     undo-tree
     use-package
     yaml-mode)))

(package-initialize)

;;; use-package

(unless (require 'use-package nil t)
  (display-warning 'init "use-package is not installed")
  (defmacro use-package (&rest args)))

;;; init-loader

(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load))
