;;
;; drot-modules.el - Enable/disable modules
;;

;; CC mode
(require 'drot-cc)

;; rcirc mode
(require 'drot-rcirc)

;; Ido
(require 'drot-ido)

;; Undo tree
(require 'drot-undo)

;; magit
(eval-after-load 'magit '(require 'drot-magit))

;; PKGBUILD mode
(require 'drot-pkgbuild)

;; SLIME
(require 'drot-slime)

;; ParEdit mode
(require 'drot-paredit)

;; YASnippet
(require 'drot-yasnippet)

;; Auto Complete
(eval-after-load 'drot-yasnippet '(require 'drot-ac))

(provide 'drot-modules)
;; drot-modules.el ends here
