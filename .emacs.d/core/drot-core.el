;;
;; drot-core.el - Core Emacs configuration
;;

;; Store all backup and auto-save files in the tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Save minibuffer history
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-autosave-interval 60
      savehist-file (expand-file-name "minbuf.hist" drot-saves-dir))
(savehist-mode t)

;; Message buffer size
(setq message-log-max 1024)

;; Ignore case on completion
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

;; More useful apropos
(setq apropos-do-all t)

;; Enable X clipboard usage
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t)

;; Default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "conkeror")

;; Ediff window placement
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally)

;; Scroll compilation buffer to first error
(setq compilation-scroll-output 'first-error)

;; Make buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;; Bookmarks
(require 'bookmark)
(setq bookmark-default-file (expand-file-name "bookmarks" drot-saves-dir)
      bookmark-save-flag 1)

;; TRAMP
(require 'tramp)
(setq tramp-default-method "ssh")

;; Saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

;; Eshell behavior
(require 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" drot-saves-dir))

;; Use ANSI colors within shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Easier switching between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Enable Winner mode
(winner-mode 1)

(provide 'drot-core)
;; drot-core.el ends here
