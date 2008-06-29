(require 'ruby-mode)
(require 'ruby-flymake)

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

(provide 'my-ruby-mode)