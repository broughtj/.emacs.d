(defvar init-theme-p nil)

(setq-default
 inhibit-startup-message t
 inhibit-default-init t
 initial-scratch-message nil
 mode-line-format nil
 indent-tabs-mode nil)

(fset #'yes-or-no-p #'y-or-n-p) ; Typing out yes/no is for losers

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'ui)
