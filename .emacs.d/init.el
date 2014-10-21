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
				    (alpha          . 90))
				  (cond ((eq system-type 'windows-nt)
					 '((font . "Consolas-10")))
					((eq system-type 'darwin)
					 '((font . "Andale Mono-12"))))
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
    (progn (global-set-key (kbd "C-c g") 'magit-status)
	   (if (eq system-type 'darwin)
	       (setq magit-emacsclient-executable "/usr/local/Cellar/emacs/24.3/bin/emacsclient"))))

;; -----------------------------------------------------------------------------
;; ruby-mode
;; -----------------------------------------------------------------------------

(if (fboundp 'ruby-mode)
    (setq auto-mode-alist (append '(("Rakefile$" . ruby-mode)
				    ("Gemfile$"  . ruby-mode)
				    (".gemspec$" . ruby-mode))
				  auto-mode-alist)))

;; -----------------------------------------------------------------------------
;; solarized-theme
;; -----------------------------------------------------------------------------

(if (member 'solarized-dark (custom-available-themes))
    (load-theme 'solarized-dark t))
