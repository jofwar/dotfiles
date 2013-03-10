;;
;; drot emacs
;;

;; Enter the debugger on an error
(setq debug-on-error t)

;; Load path
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/icicles/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Turn off the toolbar
(tool-bar-mode -1)

;; Turn off the menu bar
(menu-bar-mode -1)

;; Turn off the scrollbar
(scroll-bar-mode -1)

;; Color theme
(load-theme 'zenburn t)

;; Show tooltips in echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Answer y or n instead of yes or no at prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't show the welcome message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq gnus-inhibit-startup-message t)

;; Show unfinished keystrokes early
(setq echo-keystrokes 0.1)

; Ignore case on completion
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Message buffer size
(setq message-log-max 100)

;; Show column number in modeline
(setq column-number-mode t)

;; Encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; X clipboard copy and paste
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; Default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "conkeror")

;; Enable Easy PG
(require 'epa-file)

;; Use Ibuffer for buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Make buffer names unique
(require 'uniquify)
(setq uniquify-separator ":")
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; Ediff window placement
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Default major mode
(setq default-major-mode 'text-mode)

;; Wrap lines at 70 in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Use ANSI colors within shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Haskell mode
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; PKGBUILD mode
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; Abbreviations
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(quietly-read-abbrev-file)
(setq default-abbrev-mode t)

;; rcirc
(require 'rcirc-config)

;; Change backup behavior to save in a specified directory
(setq backup-directory-alist '(("." . "~/.emacs.d/saves/"))
      backup-by-copying      t
      version-control        t
      delete-old-versions    t
      kept-new-versions      4
      kept-old-versions      2)

;; Save minibuffer history
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

;; Calendar
(setq mark-holidays-in-calendar t
      all-christian-calendar-holidays t
      all-islamic-calendar-holidays nil
      all-hebrew-calendar-holidays nil
      european-calendar-style t
      display-time-24hr-format t
      calendar-latitude 43.20
      calendar-longitude 17.48
      calendar-location-name "Mostar, Bosnia and Herzegovina")

;; Icomplete+
(icomplete-mode t)
(setq icomplete-prospects-height 1
      icomplete-compute-delay 0)
(require 'icomplete+ nil 'noerror)

;; Icicles
(require 'icicles)
(icy-mode 1)
