(defvar init-modules-p nil)

(defvar module-list ())

(defun init-modules (&optional force-p)
  (when (or force-p (not init-modules-p))
    (setq init-modules-p t)
    (mapc
     (lambda (m) (load (gethash :path m)))
     module-list)))

(provide 'modules)
