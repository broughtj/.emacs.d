(defvar init-modules-p nil)

(defvar module-list ())

(defun load-config (&optional from)
  (cl-reduce
   (lambda (category thing)
     (cond
       ((keywordp thing) ; new category
	(concat (name thing) "/"))
       ((symbolp thing) ; new module
	(push
	 module-list
	  '(:path (concat modules-dir category thing)
	    :name thing)))
	((listp thing) ; new module with options
	 (let ((module-name (name (car thing)))
	       (options (cdr thing)))
	   (push
	    module-list
	    '(:path (concat modules-dir category module-name ".el")
              :name module-name
	      :options options))))))
     (with-current-buffer (file-file-noselect (or from (concat emacs-dir "config.el")))
       (goto-char (point-min))
       (read (current-buffer)))))


(defun init-modules (&optional force-p)
  (when (or force-p (not init-modules-p))
    (load-config)
    (mapc
     (lambda (m) (load (gethash :path m)))
     module-list)
    (setq init-modules-p t)))

(provide 'modules)
