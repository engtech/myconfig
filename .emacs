(setq auto-save-default nil)
(add-to-list 'load-path' "~/.emacs.d")
(load "project-local-variables")

;; Maximize the window...has to be first otherwise other stuff
;; gets messed up
(require 'maxframe)
(setq mf-max-width 1670)
(add-hook 'window-setup-hook 'maximize-frame t)

(server-start)

;;; Loading modes
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(global-auto-revert-mode t)

(require 'linum)
(global-linum-mode t)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'longlines-mode)

(abbrev-mode t)

; Pimp my interface
(set-default-font "-apple-monaco-medium-r-normal--16-120-72-72-m-120-iso10646-1")
(transient-mark-mode t)
(mouse-wheel-mode t)
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

(autoload 'yaml-mode "yaml-mode")
(autoload 'rafb-paste "rafb-paste" "" t)
(autoload 'pastie-region "pastie" "" t)
(require 'my-ruby)

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
