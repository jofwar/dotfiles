;;; init-packages.el --- Emacs default package selection

(require 'package)

;; Add MELPA repository
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initialize packages
(setq package-enable-at-startup nil)
(package-initialize)

;; Refresh the package database
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-package-list
  '(company
    erc-hl-nicks
    ido-hacks
    magit
    naquadah-theme
    paredit
    rainbow-delimiters
    undo-tree)
  "A list of packages to install.")

;; Install packages
(dolist (p my-package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)

;;; init-packages.el ends here