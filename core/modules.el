(require 'dash (concat core-dir "dash"))

(defvar init-modules-p nil)

(defvar module-list ())

(defun load-modules (config)
  (-reduce-from
    (lambda (acc section)
      (let ((category (concat (substring (symbol-name (car section)) 1) "/"))
	    (modules (cdr section)))
        (append 
	  (-map
	   (lambda (module)
	     (if (listp module)
	       (let ((name (car module))
		     (options (cdr module)))
	         (list :path (concat modules-dir category (symbol-name name))
		       :name name
		       :options options))
	       (list :path (concat modules-dir category (symbol-name module))
	       	     :name module)))
	   modules)
	  acc)))
    '()
    (-partition-by-header 'keywordp config)))

(defun init-modules (&optional force-p)
  (when (or force-p (not init-modules-p))
    (let* ((config (with-current-buffer (find-file-noselect (concat emacs-dir "config.el"))
		    (goto-char (point-min))
		    (read (current-buffer))))
	   (loaded (load-modules config)))
      (message "%s" loaded)
      (setq module-list (load-modules config))
      (-map 
	(lambda (m)
	  (message "%s" m)
	  (load (plist-get m :path)))
	loaded)
      (setq init-modules-p t))))

(provide 'modules)
