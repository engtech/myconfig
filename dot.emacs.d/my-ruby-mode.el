(require 'ruby-mode)
(require 'ruby-flymake)

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "<return>") 'newline-and-indent)))
(provide 'my-ruby-mode)