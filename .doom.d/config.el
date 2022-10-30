> Tangling your literate config...

Tangled 46 code blocks from config.org
  [032m✓ Done tangling 1 file(s)![0m
> Tangling your literate config...

Tangled 46 code blocks from config.org
  [032m✓ Done tangling 1 file(s)![0m
> Tangling your literate config...

Debugger entered--Lisp error: (wrong-type-argument stringp nil)
  regexp-quote(nil)
  org-src-coderef-regexp(nil)
  org-babel-tangle-single-block(1)
  org-babel-tangle-collect-blocks(nil nil)
  org-babel-tangle(nil "/home/gardner/.doom.d/config.el" nil)
  org-babel-tangle-file("/home/gardner/.doom.d/config.org" "/home/gardner/.doom.d/config.el")
  (and t (org-babel-tangle-file target dest))
  (let* ((files (and t (org-babel-tangle-file target dest)))) (if files (always (doom-print (doom-print--format (doom-print--class 'success "Done tangling %d file(s)!" (length files))) :format nil)) (progn (doom-print (doom-print--format (doom-print--class 'error "Failed to tangle any blocks from your config.")) :format nil) nil)))
  (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level 'info)) (let* ((files (and t (org-babel-tangle-file target dest)))) (if files (always (doom-print (doom-print--format (doom-print--class 'success "Done tangling %d file(s)!" (length files))) :format nil)) (progn (doom-print (doom-print--format (doom-print--class 'error "Failed to tangle any blocks from your config.")) :format nil) nil))))
  (let ((doom-print-indent (+ (if t doom-print-indent-increment 0) doom-print-indent))) (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level 'info)) (let* ((files (and t (org-babel-tangle-file target dest)))) (if files (always (doom-print (doom-print--format (doom-print--class ... "Done tangling %d file(s)!" ...)) :format nil)) (progn (doom-print (doom-print--format (doom-print--class ... "Failed to tangle any blocks from your config.")) :format nil) nil)))))
  (let* ((default-directory (or dir default-directory)) (target (expand-file-name target)) (dest (expand-file-name dest))) (doom-print (doom-print--format (doom-print--class 'start "Tangling your literate config...")) :format nil) (let ((doom-print-indent (+ (if t doom-print-indent-increment 0) doom-print-indent))) (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level 'info)) (let* ((files (and t (org-babel-tangle-file target dest)))) (if files (always (doom-print (doom-print--format ...) :format nil)) (progn (doom-print (doom-print--format ...) :format nil) nil))))))
  (and (require 'ox nil t) (require 'ob-tangle nil t) (let* ((default-directory (or dir default-directory)) (target (expand-file-name target)) (dest (expand-file-name dest))) (doom-print (doom-print--format (doom-print--class 'start "Tangling your literate config...")) :format nil) (let ((doom-print-indent (+ (if t doom-print-indent-increment 0) doom-print-indent))) (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level 'info)) (let* ((files (and t ...))) (if files (always (doom-print ... :format nil)) (progn (doom-print ... :format nil) nil)))))))
  (closure (t) (target dest &optional dir) "Tangle TARGET org file to DEST." (and (require 'ox nil t) (require 'ob-tangle nil t) (let* ((default-directory (or dir default-directory)) (target (expand-file-name target)) (dest (expand-file-name dest))) (doom-print (doom-print--format (doom-print--class 'start "Tangling your literate config...")) :format nil) (let ((doom-print-indent (+ ... doom-print-indent))) (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level ...)) (let* (...) (if files ... ...)))))))("~/.doom.d/config.org" "config.el" "~/.doom.d/")
  funcall((closure (t) (target dest &optional dir) "Tangle TARGET org file to DEST." (and (require 'ox nil t) (require 'ob-tangle nil t) (let* ((default-directory (or dir default-directory)) (target (expand-file-name target)) (dest (expand-file-name dest))) (doom-print (doom-print--format (doom-print--class 'start "Tangling your literate config...")) :format nil) (let ((doom-print-indent (+ ... doom-print-indent))) (let ((org-startup-indented nil) (org-startup-folded nil) (vc-handled-backends nil) (write-file-functions nil) (before-save-hook nil) (after-save-hook nil) (org-mode-hook nil) (org-inhibit-startup t) (org-confirm-babel-evaluate nil) (doom-print-message-level ...)) (let* (...) (if files ... ...))))))) "~/.doom.d/config.org" "config.el" "~/.doom.d/")
  eval((funcall #'(closure (t) (target dest &optional dir) "Tangle TARGET org file to DEST." (and (require 'ox nil t) (require 'ob-tangle nil t) (let* ((default-directory ...) (target ...) (dest ...)) (doom-print (doom-print--format ...) :format nil) (let (...) (let ... ...))))) "~/.doom.d/config.org" "config.el" "~/.doom.d/") t)
  command-line-1(("--load" "/home/gardner/.emacs.d/lisp/doom" "--load" "/home/gardner/.emacs.d/lisp/lib/print" "--eval" "(funcall #'(closure (t) (target dest &optional dir..."))
  command-line()
  normal-top-level()

