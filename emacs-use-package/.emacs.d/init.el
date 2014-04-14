(defvar my-emacs-dir (file-name-directory load-file-name)
  "Emacs root directory.")

(defvar my-saves-dir (expand-file-name "saves" my-emacs-dir)
  "This directory houses all save files.")
(make-directory my-saves-dir t)

(defvar my-custom-file (expand-file-name "custom.el" my-saves-dir)
  "Store changes from the customize interface in the selected file.")

;; Package repository selection and activation
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Turn off the menu bar
(menu-bar-mode 0)

;; Turn off the toolbar
(tool-bar-mode 0)

;; Turn off the scrollbar
(scroll-bar-mode 0)

;; Don't show the welcome messages
(setq inhibit-startup-screen t
      initial-scratch-message nil
      gnus-inhibit-startup-message t)

;; Encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Store all backup and auto-save files in the saves directory
(setq backup-directory-alist
      `((".*" . ,my-saves-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,my-saves-dir t)))
(setq auto-save-list-file-prefix (expand-file-name ".saves-" my-saves-dir))

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Enable all disabled commands
(setq disabled-command-function nil)

;; Ignore case on completion
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

;; Answer y or n instead of yes or no at prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Show unfinished keystrokes early
(setq echo-keystrokes 0.1)

;; Show column number and buffer size on the modeline
(column-number-mode 1)
(size-indication-mode 1)

;; Show tooltips in echo area
(tooltip-mode 0)

;; Keep point on same position when scrolling
(setq scroll-preserve-screen-position 1)

;; Enable X clipboard usage
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t)

;; Mouse yank at point instead of click
(setq mouse-yank-at-point t)

;; Swap Isearch with regexp Isearch
(bind-key "C-s" 'isearch-forward-regexp)
(bind-key "C-r" 'isearch-backward-regexp)
(bind-key "C-M-s" 'isearch-forward)
(bind-key "C-M-r" 'isearch-backward)

;; Color theme
(use-package naquadah-theme
  :ensure t)

;; Save minibuffer history
(use-package savehist
  :init
  (progn
    (setq savehist-additional-variables '(search-ring regexp-search-ring)
          savehist-autosave-interval 60
          savehist-file (expand-file-name "minbuf.hist" my-saves-dir))
    (savehist-mode 1)))

;; Remember point position in files
(use-package saveplace
  :init
  (setq-default save-place t)
  :config
  (setq save-place-file (expand-file-name "saved-places" my-saves-dir)))

;; Bookmarks save directory
(use-package bookmark
  :defer t
  :config
  (setq bookmark-default-file (expand-file-name "bookmarks" my-saves-dir)
        bookmark-save-flag 1))

;; Eshell save directory
(use-package eshell
  :defer t
  :config
  (setq eshell-directory-name (expand-file-name "eshell" my-saves-dir)))

;; Highlight matching parentheses
(use-package paren
  :init
  (show-paren-mode 1)
  :config
  (setq show-paren-delay 0))

;; Delete a selection with a keypress
(use-package delsel
  :init
  (delete-selection-mode 1))

;; Scroll compilation buffer to first error
(use-package compile
  :defer t
  :config
  (setq compilation-scroll-output 'first-error))

;; Use Unified diff format
(use-package diff
  :defer t
  :config
  (setq diff-switches "-u"))

;; Ediff window split
(use-package ediff
  :defer t
  :config
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain))

;; TRAMP default file transfer method
(use-package tramp
  :defer t
  :config
  (setq tramp-default-method "ssh"))

;; Prevent GnuTLS warnings
(use-package gnutls
  :defer t
  :config
  (setq gnutls-min-prime-bits 1024))

;; Use ANSI colors within shell-mode
(use-package shell
  :defer t
  :init
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on))

;; Load abbrevs and enable Abbrev Mode
(use-package abbrev
  :init
  (progn
    (setq abbrev-file-name (expand-file-name "abbrev_defs" my-saves-dir)
          save-abbrevs t)
    (if (file-exists-p abbrev-file-name)
        (quietly-read-abbrev-file))
    (setq-default abbrev-mode t)))

;; Hippie expand is an improved dabbrev expand
(use-package hippie-exp
  :bind ("M-/" . hippie-expand)
  :config
  (setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                           try-expand-dabbrev-all-buffers
                                           try-expand-dabbrev-from-kill
                                           try-complete-file-name-partially
                                           try-complete-file-name
                                           try-expand-all-abbrevs
                                           try-expand-list
                                           try-expand-line
                                           try-complete-lisp-symbol-partially
                                           try-complete-lisp-symbol)))

;; Show documentation with ElDoc mode
(use-package eldoc
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
  (add-hook 'ielm-mode-hook 'eldoc-mode)
  :config
  (eldoc-add-command 'paredit-backward-delete
                     'paredit-close-round))

;; CC mode configuration
(use-package cc-mode
  :defer t
  :init
  (progn
    (defun my-c-mode-hook ()
      "C mode setup"
      (unless (or (file-exists-p "makefile")
                  (file-exists-p "Makefile"))
        (set (make-local-variable 'compile-command)
             (concat "gcc " (buffer-file-name) " -o "))))

    (add-hook 'c-mode-hook 'my-c-mode-hook)

    (defun my-c++-mode-hook ()
      "C++ mode setup"
      (unless (or (file-exists-p "makefile")
                  (file-exists-p "Makefile"))
        (set (make-local-variable 'compile-command)
             (concat "g++ " (buffer-file-name) " -o "))))

    (add-hook 'c++-mode-hook 'my-c++-mode-hook)
    (add-hook 'c-mode-common-hook 'auto-fill-mode))
  :config
  (setq c-basic-offset 4
        c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "stroustrup"))))

;; Fly Spell mode configuration
(use-package flyspell
  :defer t
  :init
  (add-hook 'text-mode-hook 'flyspell-mode)
  :config
  (setq ispell-program-name "aspell"
        ispell-extra-args '("--sug-mode=ultra")
        ispell-dictionary "english"))

;; Doc View mode configuration
(use-package doc-view
  :defer t
  :config
  (setq doc-view-resolution 300
        doc-view-continuous t))

;; Use Ibuffer for buffer list
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-default-sorting-mode 'major-mode))

;; Open URLs in eww
(use-package browse-url
  :defer t
  :config
  (setq browse-url-browser-function 'eww-browse-url))

;; Saner regex syntax
(use-package re-builder
  :defer t
  :config
  (setq reb-re-syntax 'string))

;; Icomplete
(use-package icomplete
  :init
  (icomplete-mode 1)
  :config
  (setq icomplete-prospects-height 1))

;; Company mode
(use-package company
  :ensure t
  :diminish "co"
  :init
  (progn
    (setq company-echo-delay 0
          company-show-numbers t
          company--disabled-backends '(company-eclim
                                       company-clang
                                       company-xcode
                                       company-ropemacs
                                       company-oddmuse))
    (global-company-mode 1)))

;; ERC configuration
(defun my-erc ()
  "Connect to IRC."
  (interactive)
  (erc-tls :server "adams.freenode.net" :port 6697
           :nick "drot")
  (erc-tls :server "pine.forestnet.org" :port 6697
           :nick "drot"))

(use-package erc
  :defer t
  :config
  (progn
    (add-to-list 'erc-modules 'notifications)
    (add-to-list 'erc-modules 'scrolltobottom)
    (add-to-list 'erc-modules 'smiley)
    (erc-spelling-mode 1)

    (add-hook 'erc-mode-hook
              (defun fix-scrolling-bug ()
                "Keep the prompt at bottom"
                (set (make-local-variable 'scroll-conservatively) 1000)))

    (setq erc-prompt-for-password nil
          erc-autojoin-channels-alist '(("freenode" "#debian" "#emacs")
                                        ("forestnet" "#reloaded" "#fo2"))
          erc-server-reconnect-timeout 10
          erc-fill-function 'erc-fill-static
          erc-fill-column 120
          erc-fill-static-center 15
          erc-lurker-hide-list '("JOIN" "PART" "QUIT" "NICK" "AWAY")
          erc-track-exclude-server-buffer t
          erc-track-showcount t
          erc-track-switch-direction 'importance
          erc-track-visibility 'selected-visible
          erc-insert-timestamp-function 'erc-insert-timestamp-left
          erc-timestamp-only-if-changed-flag nil
          erc-timestamp-format "[%H:%M] "
          erc-interpret-mirc-color t
          erc-button-buttonize-nicks nil
          erc-nick-uniquifier "_"
          erc-header-line-format "%t: %o"
          erc-prompt (lambda ()
                       (if erc-network
                           (concat "[" (symbol-name erc-network) "]")
                         (concat "[" (car erc-default-recipients) "]"))))))

;; ERC Highlight Nicks
(use-package erc-hl-nicks
  :ensure t
  :defer t)

;; Lua mode
(use-package lua-mode
  :ensure t
  :defer t)

;; Calendar configuration
(use-package calendar
  :defer t
  :config
  (setq calendar-mark-holidays-flag t
        holiday-general-holidays nil
        holiday-bahai-holidays nil
        holiday-oriental-holidays nil
        holiday-solar-holidays nil
        holiday-islamic-holidays nil
        holiday-hebrew-holidays nil
        calendar-date-style 'european
        calendar-latitude 43.20
        calendar-longitude 17.48
        calendar-location-name "Mostar, Bosnia and Herzegovina"))

;; Org mode configuration
(bind-key "\C-cl" 'org-store-link)
(bind-key "\C-ca" 'org-agenda)

(use-package org
  :defer t
  :config
  (progn
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((C . t)
       (emacs-lisp . t)
       (sh . t)))
    (setq org-log-done 'time
          org-src-fontify-natively t
          org-src-tab-acts-natively t)))

;; ParEdit
(use-package paredit
  :ensure t
  :diminish "PEd"
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'ielm-mode-hook 'paredit-mode)
    (add-hook 'lisp-mode-hook 'paredit-mode)
    (add-hook 'lisp-interaction-mode-hook 'paredit-mode)
    (add-hook 'scheme-mode-hook 'paredit-mode)

    (defvar paredit-minbuf-commands '(eval-expression
                                      pp-eval-expression
                                      eval-expression-with-eldoc
                                      ibuffer-do-eval
                                      ibuffer-do-view-and-eval)
      "Interactive commands for which ParEdit should be enabled in the minibuffer.")

    (defun paredit-minbuf ()
      "Enable ParEdit during lisp-related minibuffer commands."
      (if (memq this-command paredit-minbuf-commands)
          (paredit-mode)))

    (add-hook 'minibuffer-setup-hook 'paredit-minbuf)

    (defun paredit-slime-fix ()
      "Fix ParEdit conflict with SLIME."
      (define-key slime-repl-mode-map
        (read-kbd-macro paredit-backward-delete-key) nil))

    (add-hook 'slime-repl-mode-hook 'paredit-mode)
    (add-hook 'slime-repl-mode-hook 'paredit-slime-fix))
  :config
  (progn
    (put 'paredit-forward-delete 'delete-selection 'supersede)
    (put 'paredit-backward-delete 'delete-selection 'supersede)
    (put 'paredit-open-round 'delete-selection t)
    (put 'paredit-open-square 'delete-selection t)
    (put 'paredit-doublequote 'delete-selection t)
    (put 'paredit-newline 'delete-selection t)))

;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Skeleton mode configuration
(use-package skeleton
  :config
  (setq skeleton-further-elements '((abbrev-mode nil))))

(define-skeleton my-cpp-skel
  "C++ skeleton"
  nil
  "#include <iostream>\n"
  "\n"
  "int main ()\n"
  "{\n"
  > _
  "\n"
  > "return 0;"
  "\n}")

;; Undo Tree
(use-package undo-tree
  :ensure t
  :diminish "UT"
  :init
  (progn
    (setq undo-tree-history-directory-alist `((".*" . ,my-saves-dir))
          undo-tree-auto-save-history t)
    (global-undo-tree-mode 1)))

;; Load changes from the customize interface
(if (file-exists-p my-custom-file)
    (load my-custom-file))