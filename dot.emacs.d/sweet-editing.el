(define-key global-map (kbd "C-S-k") 'kill-whole-line)

(defun duplicate-line()
  "Duplicate the current line"
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position))
        (column (current-column)))
    (copy-region-as-kill beg end)
    (end-of-line)
    (newline)
    (yank)
    (move-to-column column)))
(define-key global-map (kbd "C-S-d") 'duplicate-line)

(provide 'sweet-editing)