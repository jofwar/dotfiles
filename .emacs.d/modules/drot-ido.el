;;
;; drot-ido.el - Configuration for Ido
;;

;; Enable Ido
(require 'ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" drot-saves-dir)
      ido-default-file-method 'selected-window)
(ido-mode 1)

;; Extend Ido completion
(require 'ido-hacks)
(ido-hacks-mode 1)

;; Use Ido for Imenu
(require 'ido-imenu)

(provide 'drot-ido)
;; drot-ido.el ends here