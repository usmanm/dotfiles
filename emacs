(add-to-list 'load-path "~/.emacs.d")

;; (require 'lambda-mode)
;; (add-hook 'python-mode-hook #'lambda-mode 1)

;; (setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))

;; Delete trailing white space.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Auto-tabbing when going to next line.
(add-hook 'python-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

;; Don't show toolbar.
(tool-bar-mode 0)

;; Fill with spaces not tabs.
(setq-default indent-tabs-mode nil)

;; Delete selected text when typing/pasting.
(delete-selection-mode t)

;; Add new line at the end.
(setq mode-require-final-newline t)

;; I hate tabs!
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Display line/column.
(setq line-number-mode t)
(setq column-number-mode t)

;; Don't show the startup message.
(setq inhibit-startup-message t)

;; Python mode hooks.
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 2)
    (setq python-indent 2)))

;; JavaScript mode hooks.
(add-hook 'js-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 2)
    (setq js-indent-level 2)))

;; set up shortcuts
;; Note: it does not currently work to say
;;   (global-set-key 'f3 "\C-x\C-f")
;; The reason is that macros can't do interactive things properly.
;; This is an extremely longstanding bug in Emacs.  Eventually,
;; it will be fixed. (Hopefully...)
(global-set-key [f1] 'help-command) ; Make F1 invoke help
(global-set-key [f2] 'undo) ; Make F2 be `undo'
(global-set-key [f3] 'find-file) ; Make F3 be `find-file'
;; (global-set-key (kbd "C-x g") 'goto-line) ; [Ctrl]-[x] [g] `goto-line'
;; (global-set-key (kbd "C-x r") 'query-replace) ; [Ctrl]-[x] [r] `query-replace'

;; M-x python-check.
(setq python-check-command "pyflakes")

;; PyFlakes.
;; code checking via pyflakes+flymake.
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
  'flymake-create-temp-inplace))
  (local-file (file-relative-name
  temp-file
  (file-name-directory buffer-file-name))))
  (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
  '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Fix pyflakes color stuff.
(custom-set-faces
  '(flymake-errline ((((class color)) (:background "Brown"))))
  '(flymake-warnline ((((class color)) (:background "Brown")))))
;; (setq flymake-log-level 3)

;; Autopair brackets etc.
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
(put 'upcase-region 'disabled nil)
