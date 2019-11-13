(defvar init-packages-p nil)

(defvar package-list ())

;;;###autoload
(defun package (name)
  (push name package-list))

(defun ensure-straight ()
  (defvar boostrap-version)
  (let* ((user-emacs-directory local-dir)
	 (bootstrap-file (concat local-dir "straight/repos/straight.el/bootstrap.el"))
	 (bootstrap-version 5))
    (make-directory (concat local-dir "straight/build") 'parents)
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	   'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))

(defun init-packages ()
  (when (or force-p (not init-packages-p))
    (ensure-straight)
    (require 'straight)
    (message "%s" package-list)
    (mapc #'straight-use-package package-list)
    (setq init-packages-p t)))

(provide 'packages)
