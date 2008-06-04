(add-to-list 'load-path' "~/.emacs.d")
(load "project-local-variables")

(server-start)

;;; Loading modes
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(global-auto-revert-mode t)

;; Don't use linum because it fails with emacs 22.2 + outline-mode
;; where the outline has newlines in it
(require 'linum)
;(global-linum-mode t)
(column-number-mode 1)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

(abbrev-mode t)

(add-to-list 'auto-mode-alist '("dot.emacs" . emacs-lisp-mode))

(require 'ruby-mode)
(require 'rspec-mode)
(require 'javascript-mode)
(load "my-textmate")

(show-paren-mode t)

; Pimp my interface
(set-default-font "-apple-monaco-medium-r-normal--16-120-72-72-m-120-iso10646-1")
(transient-mark-mode t)
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
  numbers with the C-x C-j prefix.  Another mode,
  `window-number-meta-mode' enables the use of the M- prefix."
  t)
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)
(window-number-mode 1)
(window-number-meta-mode 1)

(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)
(set-frame-position (selected-frame) 0 0)
(defun max-window ()
  (interactive)
  (mac-toggle-max-window))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(require 'sweet-editing)
(require 'auto-indent)

;;; SLIME & Lisp
(add-to-list 'load-path' "~/work/lisp/slime-2.0/")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup)

;; Keybindings ftw
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-x t") 'transpose-words)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
