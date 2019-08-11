(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;(setq pug-tab-width 2)
;(setq js-indent-level 2)
;(setq web-mode-markup-indent-offset 2)
;(setq css-indent-offset 2)
;(setq web-mode-css-indent-offset 2)
;(setq web-mode-code-indent-offset 2)
;(setq-default indent-tabs-mode nil)

;(use-package cider
;  :mode ("\\.clj\\'" . clojure-mode))
(use-package evil
  :config (evil-mode 1))
;(use-package emmet-mode
;  :mode ("\\.html?\\'" "\\.css\\'" "\\.styl\\'" "\\.pug\\'"))
(use-package ivy
  :config (ivy-mode 1))
;(use-package lsp-mode
  ;:commands lsp)
;(use-package lsp-ui :commands lsp-ui-mode)
;(use-package company
;  :config (add-hook 'after-init-hook 'global-company-mode))
;(use-package company-lsp
;  :config (push 'company-lsp company-backends)
;  :commands company-lsp)
;(use-package pug-mode
;  :mode "\\.pug\\'")
;(use-package stylus-mode
;  :mode "\\.styl\\'")
;(use-package sws-mode)
;(use-package rust-mode
;  :mode "\\.rs\\'")
;(use-package treemacs)
;(use-package yasnippet)
;(use-package web-mode
;  :mode "\\.php\\'" "\\.html?\\'")

(provide 'packages)
