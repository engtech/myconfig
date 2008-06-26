;;;
;;; rspec-mode.el
;;;
;;; Pat Maddox

(define-derived-mode rspec-mode ruby-mode
  "Toggle RSpec mode"
  nil
  " RSpec")
(add-to-list 'auto-mode-alist '("_spec.rb$" . rspec-mode))

;; (defun run-specs ()
;;   "Run specs and display results in same buffer"
;;   (interactive)
;;   (start-process "rspec" "rspec" "ruby" (buffer-file-name)))

;; (defun run-focused-spec ()
;;   "Run the example defined on the current line"
;;   (interactive)
;;   (start-process "rspec" "rspec" "ruby" ))

(provide 'rspec-mode)