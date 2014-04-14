;;; init-undotree.el --- Undo Tree configuration

;; Store Undo Tree history in the tmp directory
(setq undo-tree-history-directory-alist
      `((".*" . ,my-tmp-dir)))

;; Enable Undo Tree history
(setq undo-tree-auto-save-history t)

;; Shorten Undo Tree mode lighter
(setq undo-tree-mode-lighter " UT")

;; Enable Undo Tree
(global-undo-tree-mode)

(provide 'init-undotree)

;;; init-undotree.el ends here