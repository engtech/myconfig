(defun generate-tags-for-project ()
  (interactive)
  (save-excursion
    (shell-command (concat "cd " (project-root) " && find . -type f | grep -v '\.git' | grep -v '\.svn' | grep -v '^\./vendor' | grep -v '~$' | grep -v '^\.#' | grep -v '^#' | grep -v '#$' | xargs file | grep 'text' | awk '{print $1}' | sed 's/:$//' | xargs etags -l none"))))

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
  
(global-set-key (kbd "M-t") 'find-files-in-project)

(provide 'project-nav)