;;(define-key ruby-mode-map (kbd "RET") 'ruby-reindent-then-newline-and-indent)

;;(defadvice yank (after indent-region activate)
;;  (if (member major-mode '(ruby-mode emacs-lisp-mode scheme-mode lisp-mode
;;                                     c-mode c++-mode objc-mode
;;                                     latex-mode plain-tex-mode))
;;      (indent-region (region-beginning) (region-end) nil)))
;;
;;(defadvice yank-pop (after indent-region activate)
;;  (if (member major-mode '(ruby-mode emacs-lisp-mode scheme-mode lisp-mode
;;                                     c-mode c++-mode objc-mode
;;                                     latex-mode plain-tex-mode))
;;      (indent-region (region-beginning) (region-end) nil)))

(provide 'auto-indent)