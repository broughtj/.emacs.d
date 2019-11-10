(defvar init-packages-p nil)

(defvar package-list () "A list of enabled packages.")

(defun package (name &rest)
  (push name package-list))

(defun ensure-straight ()
  (defvar boostrap-version)
  (let* ((user-emacs-directory straigt-base-dir)
	 (bootstrap-file (path straight-base-dir "straight/repos/straight.el/straight.el"))
	 (bootstrap-version 5))
    (make-directory (path straight-base-dir "straight/build") 'parents)
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	   'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load boostrap-file nil 'nomessage)))

(defun init-packages ()
  (when (or force-p (not init-packages-p))
    (ensure-straight)
    (require 'straight)
    (mapc #'straight-use-package package-list)
    (setq init-packages-p t)))

(provide 'packages)
