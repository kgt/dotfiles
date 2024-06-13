;;; -*- lexical-binding: t; -*-

;;; Package
(setopt package-archives
        '(("gnu"   . "https://elpa.gnu.org/packages/")
          ("melpa" . "https://melpa.org/packages/")))
(setopt package-selected-packages
        '(anzu
          consult
          corfu
          ddskk
          diminish
          dracula-theme
          exec-path-from-shell
          flycheck
          inf-ruby
          magit
          orderless
          ruby-end
          sass-mode
          slim-mode
          undo-tree
          vertico
          yaml-mode))

;;; General
;; Set default coding to UTF-8.
(prefer-coding-system 'utf-8-unix)

;; Disable startup messages.
(setopt inhibit-startup-screen t)
(setopt initial-scratch-message nil)

;; Disable backup files.
(setopt make-backup-files nil)

;; Disable storing customization to `init.el'.
(setopt custom-file (locate-user-emacs-file "custom.el"))

;; Track recently opened files.
(setopt recentf-max-saved-items 100)
(recentf-mode)

;; Disable transient mark mode.
(transient-mark-mode -1)

;; Disable using tabs on indentation.
(setq-default indent-tabs-mode nil)

;; Auto complete parenthesis.
(electric-pair-mode)

;; Enable truncate lines on `prog-mode'.
(defun my/enable-truncate-lines ()
  (setq truncate-lines t))
(add-hook 'prog-mode-hook #'my/enable-truncate-lines)

;; Set `exec-path'.
(use-package exec-path-from-shell
  :unless (eq system-type 'windows-nt)
  :config
  (exec-path-from-shell-initialize))

;;; Display
;; Font
(let ((font (cond ((eq system-type 'windows-nt)
                   "Consolas-10")
                  (t
                   "Monospace-10"))))
  (setopt default-frame-alist
          `((font  . ,font))))

;; Disable tool bar.
(tool-bar-mode -1)

;; Display line number, column number.
(line-number-mode)
(column-number-mode)

;; Highlight current line.
(global-hl-line-mode)

;; Theme
(let ((theme 'dracula))
  (when (member theme (custom-available-themes))
    (load-theme theme t)))

;;; General keybindings
(bind-key "C-c r" #'recentf-open)
(bind-key "C-c t" #'toggle-truncate-lines)

(windmove-default-keybindings)

;; anzu
(use-package anzu
  :demand t
  :diminish anzu-mode
  :bind
  (;; M-%
   ([remap query-replace] . anzu-query-replace)
   ;; C-M-%
   ([remap query-replace-regexp] . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))

;; consult
(use-package consult
  :bind
  (;; C-x b
   ([remap switch-to-buffer] . consult-buffer)
   ;; C-x 4 b
   ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
   ;; C-x 5 b
   ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
   ;; C-x t b
   ([remap switch-to-buffer-other-tab] . consult-buffer-other-tab)
   ;; M-y
   ([remap yank-pop] . consult-yank-pop)
   ;; M-g g / M-g M-g
   ([remap goto-line] . consult-goto-line))
  :init
  (setopt consult-goto-line-numbers nil))

;; magit
(use-package magit
  :bind
  (("C-c g" . magit-status)))

;;; Completion
;; Use `TAB' for completion.
(setopt tab-always-indent 'complete)

(use-package vertico
  :init
  (setopt vertico-scroll-margin 1)
  (setopt vertico-cycle t)
  :config
  (vertico-mode))

(use-package orderless
  :config
  (setopt completion-styles '(orderless basic)))

(use-package corfu
  :init
  (setopt corfu-auto t)
  (setopt corfu-scroll-margin 1)
  (setopt corfu-cycle t)
  :config
  (global-corfu-mode))

;;; Languages
(use-package flycheck
  :config
  (global-flycheck-mode))

;;; Languages - Ruby
;; Disable inserting a encoding comment.
(setopt ruby-insert-encoding-magic-comment nil)

;; Indent like below:
;;   var = if cond
;;     1
;;   else
;;     2
;;   end
(setopt ruby-align-to-stmt-keywords t)

;; Use `ruby-ts-mode' if available.
(when (treesit-language-available-p 'ruby)
  (add-to-list 'major-mode-remap-alist
               '(ruby-mode . ruby-ts-mode)))

;; Disable inserting a new line on auto completing `end'.
(setopt ruby-end-insert-newline nil)

;;; Languages - CSS
(setopt css-indent-offset 2)

;;; Languages - JavaScript
(setopt js-indent-level 2)

;;; Languages - Shell Script
(setopt sh-basic-offset 2)
(setopt sh-indentation 2)

;;; Misc Packages
(use-package skk
  :defer t
  :init
  (setopt default-input-method "japanese-skk")
  (setopt skk-server-host "localhost")
  (setopt skk-server-portnum 1178)
  (setopt skk-search-sagyo-henkaku t)
  (setopt skk-egg-like-newline t)
  :hook
  (isearch-mode . skk-isearch-mode-setup)
  (isearch-mode-end . skk-isearch-mode-cleanup)
  :config
  (require 'skk-hint))

(use-package undo-tree
  :demand t
  :diminish undo-tree-mode
  :init
  (setopt undo-tree-auto-save-history nil)
  :config
  (global-undo-tree-mode))
