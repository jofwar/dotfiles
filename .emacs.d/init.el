;;
;; init.el
;;

;; Define directories
(defvar my-emacs-dir (file-name-directory load-file-name)
  "The root directory of the Emacs distribution.")

(defvar my-core-dir (expand-file-name "core" my-emacs-dir)
  "This directory houses the Emacs core configuration.")

(defvar my-modules-dir (expand-file-name "modules" my-emacs-dir)
  "This directory houses all of the Emacs modules.")

(defvar my-elisp-dir (expand-file-name "elisp" my-emacs-dir)
  "This directory houses custom elisp files.")

(defvar my-saves-dir (expand-file-name "saves" my-emacs-dir)
  "This directory houses all save files.")

;; Add directories to load path
(add-to-list 'load-path my-core-dir)
(add-to-list 'load-path my-modules-dir)
(add-to-list 'load-path my-elisp-dir)

(defvar my-custom-file (expand-file-name "custom.el" my-saves-dir)
  "Store changes from the customize interface in the selected file.")

;; Load changes from the customize interface
(if (file-exists-p my-custom-file)
  (load my-custom-file))

;; Load packages
(require 'my-packages)

;; Load UI configuration
(require 'my-ui)

;; Load general configuration
(require 'my-core)

;; Load editing-specific configuration
(require 'my-editor)

;; Load modules
(require 'my-modules)

;; Load custom key bindings
(require 'my-keybindings)

;; init.el ends here
