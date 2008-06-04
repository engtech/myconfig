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

(defun insert-and-move-to-new-line ()
  "Inserts a blank line after the current one"
  (interactive)
  (end-of-line)
  (newline))
(define-key global-map (kbd "M-<return>") 'insert-and-move-to-new-line)

(defun insert-before-and-move-to-new-line ()
  "Inserts a blank line before the current one"
  (interactive)
  (previous-line)
  (insert-and-move-to-new-line))
(define-key global-map (kbd "C-M-<return>") 'insert-before-and-move-to-new-line)

(provide 'sweet-editing)