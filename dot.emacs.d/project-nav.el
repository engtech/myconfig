(defun generate-tags-for-project ()
  (interactive)
  (let ((prev-dir default-directory))
    (cd (project-root))
    (setq files-list (do-filtering (file-filters) (files-with-relative-paths (project-root) (recursive-directory-files (project-root)))))
    (cd prev-dir)
    (build-tags-for-files files-list)
    t))

(defun project-root ()
  (let ((project-file (plv-find-project-file default-directory "")))
    (unless project-file (error "No project root found"))
    (file-name-directory project-file)))

(defun choose-file-from-project (fun)
  (save-excursion
    (let ((tags-file (concat (project-root) "TAGS")))
      (unless (file-exists-p tags-file) (error "No TAGS file found"))
      (visit-tags-table-buffer tags-file)
      (let ((chosen-file
             (ido-completing-read "Project file: "
                                  (tags-table-files)
                                  nil t)))
        (funcall fun chosen-file)))))

(defun find-files-in-project ()
  (interactive)
  (choose-file-from-project (lambda (file) (find-file file))))

(defun recursive-directory-files (dir)
  (let ((dir (file-name-as-directory dir)))
    (apply 'append
           (mapcar
            (lambda (f)
              (let ((f (concat dir f)))
                (if (file-directory-p f)
                    (cons f (recursive-directory-files f))
                  (list f))))
            (remove ".."
                    (remove "."
                            (condition-case nil
                                (directory-files dir)
                              (error nil))))))))


(defun build-tags-for-files (files)
  (shell-command (concat "cd " (project-root) " && etags -l none "
                         (mapconcat 'identity
                                    (mapcar (lambda (s) (concat "'" s "'")) files)
                                    " "))))

(defun known-file-type-p (file)
  (detect
   (mapcar
    (lambda (regex) (string-match regex file))
    (list "\.rb$"
          "^Rakefile$"
          "\.el$"
          ))
   (lambda (matches) matches)))

(defun file-filters ()
  (list
   (lambda (s) (file-directory-p s))
   (lambda (s) (string-match "\.git" s))
   (lambda (s) (string-match "\.svn" s))
   (lambda (s) (string-match "^vendor\/" s))
   (lambda (s) (string-match "~$" s))
   (lambda (s) (string-match "^\.#" s))
   (lambda (s) (string-match "^#" s))
   (lambda (s) (string-match "#$" s))

   (lambda (s)
     (and (not (known-file-type-p s))
          (let* ((result
                  (shell-command-to-string (concat "file '" s "' | awk '{$1=\"\"; print}'")))
                 (file-type (replace-regexp-in-string "^[ ]*\\(.*\\)[ \n]*$" "\\1" result)))
            (not (or (string= "" file-type) (string-match "text" file-type)))))
     )
   ))

(defun apply-filter (f list)
  (remove-if (lambda (s) (funcall f s)) list))

(defun files-with-relative-paths (base list)
  (mapcar
   (lambda (s)
     (replace-regexp-in-string (regexp-quote base) "" s))
   list))

(defun do-filtering (filters-list list)
  (let ((filtered-list (apply-filter (car filters-list) list)))
        (if (cdr filters-list)
            (do-filtering (cdr filters-list) filtered-list)
          filtered-list)))

  
(global-set-key (kbd "M-t") 'find-files-in-project)

(provide 'project-nav)