;;; -*- lexical-binding: t; -*-

;; Package
(package-install-selected-packages t)

;; Treesit
(setopt treesit-language-source-alist
        '((ruby "https://github.com/tree-sitter/tree-sitter-ruby.git")))
(mapc (lambda (lang)
        (unless (treesit-language-available-p lang)
          (treesit-install-language-grammar lang)))
      (mapcar #'car treesit-language-source-alist))
