(defvar emacs-dir (file-truename user-emacs-directory))
(defvar core-dir (concat emacs-dir "core/"))
(defvar modules-dir (concat emacs-dir "modules/"))
(defvar local-dir (concat emacs-dir ".local/"))
(defvar etc-dir (concat local-dir "etc/"))
(defvar cache-dir (concat local-dir "cache/"))
(defvar packages-dir (concat local-dir "packages/"))

(setq-default
 auto-save-default nil
 create-lockfiles nil
 make-backup-files nil
 inhibit-startup-message t
 inhibit-default-init t

 ;; Don't litter `emacs-dir`
 auto-save-list-file-name     (concat local-dir "autosave")
 backup-directory-alist       (list (cons "." (concat cache-dir "backup/")))
 custom-file                  (concat core-dir "custom.el")
 tramp-auto-save-directory    (concat cache-dir "tramp-auto-save")
 tramp-backup-directory-alist backup-directory-alist
 tramp-persistency-file-name  (concat cache-dir "tramp-persistency.el"))

(defun initialize ()
  (add-to-list 'load-path core-dir)
  (require 'ui)
  (require 'packages))

(initialize)

(provide 'main)
