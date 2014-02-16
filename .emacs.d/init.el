;; -----------------------------------------------------------------------------
;; 一般
;; -----------------------------------------------------------------------------

;; エンコーディング
(prefer-coding-system 'utf-8)

;; バックアップファイルを作らない
(setq make-backup-files nil)

;; 起動画面
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; ウィンドウサイズ、フォント
(setq default-frame-alist (append '((width          . 80)
				    (height         . 47)
				    (tool-bar-lines . nil)
				    (font           . "Andale Mono-12")
				    (alpha          . 90))
				  default-frame-alist))

;; 行数、桁数
(line-number-mode t)
(column-number-mode t)

;; Transient Mark Modeを無効にする
(transient-mark-mode 0)

;; 折り返し
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; yes or noをy or nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; ウィンドウ移動
(windmove-default-keybindings)

;; -----------------------------------------------------------------------------
;; package
;; -----------------------------------------------------------------------------

(if (fboundp 'package-initialize)
    (progn (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
				    ("melpa" . "http://melpa.milkbox.net/packages/")))
	   (package-initialize)))

;; -----------------------------------------------------------------------------
;; coffee-mode
;; -----------------------------------------------------------------------------

(if (fboundp 'coffee-mode)
    (setq coffee-tab-width 2))

;; -----------------------------------------------------------------------------
;; color-theme
;; -----------------------------------------------------------------------------

(if (fboundp 'color-theme-initialize)
    (progn (color-theme-initialize)
	   (color-theme-dark-laptop)))

;; -----------------------------------------------------------------------------
;; css-mode
;; -----------------------------------------------------------------------------

(if (fboundp 'css-mode)
    (setq css-indent-offset 2))

;; -----------------------------------------------------------------------------
;; flymake-ruby
;; -----------------------------------------------------------------------------

(if (fboundp 'flymake-ruby-load)
    (add-hook 'ruby-mode-hook 'flymake-ruby-load))

;; -----------------------------------------------------------------------------
;; magit
;; -----------------------------------------------------------------------------

(if (fboundp 'magit-status)
    (global-set-key (kbd "C-c g") 'magit-status))

;; -----------------------------------------------------------------------------
;; ruby-mode
;; -----------------------------------------------------------------------------

(if (fboundp 'ruby-mode)
    (setq auto-mode-alist (append '(("Rakefile$" . ruby-mode)
				    ("Gemfile$"  . ruby-mode))
				  auto-mode-alist)))
