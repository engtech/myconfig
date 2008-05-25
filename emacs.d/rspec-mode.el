;;;
;;; rspec-mode.el
;;;
;;; Pat Maddox

(define-derived-mode rspec-mode ruby-mode
  "Toggle RSpec mode"
  nil
  " RSpec")
(add-to-list 'auto-mode-alist '("_spec.rb$" . rspec-mode))

(provide 'rspec-mode)