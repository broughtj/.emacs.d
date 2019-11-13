(defconst emacs-dir (file-truename user-emacs-directory))
(defconst core-dir (concat emacs-dir "core/"))
(defconst modules-dir (concat emacs-dir "modules/"))
(defconst local-dir (concat emacs-dir ".local/"))
(defconst etc-dir (concat local-dir "etc/"))
(defconst cache-dir (concat local-dir "cache/"))
(defconst packages-dir (concat local-dir "packages/"))

(defvar init-p nil)
(defvar init-time nil)

(setq-default
 ;; Don't create annoying files
 auto-save-default nil
 create-lockfiles nil
 make-backup-files nil

 ;; Don't litter emacs-dir
 auto-save-list-file-name     (concat cache-dir "autosave")
 backup-directory-alist       (list (cons "." (concat cache-dir "backup/")))
 custom-file                  (concat core-dir "custom.el")
 tramp-auto-save-directory    (concat cache-dir "tramp-auto-save")
 tramp-backup-directory-alist backup-directory-alist
 tramp-persistency-file-name  (concat cache-dir "tramp-persistency.el"))

(defun init (&optional force-p)
  (when (or force-p (not init-p))
    (require 'ui (concat core-dir "ui"))
    (require 'modules (concat core-dir "modules"))
    (require 'packages (concat core-dir "packages"))

    (init-modules)
    (init-packages)

    (setq init-p t)))

(provide 'core)
