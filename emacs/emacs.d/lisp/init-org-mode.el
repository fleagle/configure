(provide 'init-org-mode)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require-package 'org-plus-contrib)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'spacemacs/toggle-line-numbers-off 'append)
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))
(setq org-log-done 'time)
(setq org-log-done 'note)

(add-hook 'org-mode-hook (lambda () (modify-syntax-entry (string-to-char "\u25bc") "w"))) ; Down arrow for collapsed drawer.
(setq org-src-fontify-natively t)
(setq org-src-preserve-indentation t)
(setq org-startup-indented t)
(setq org-hide-leading-stars nil)
(setq org-odd-level-only nil)
(setq org-insert-heading-respect-content nil)
(setq org-M-RET-may-split-line '((item) (default . t)))
(setq org-special-ctrl-a/e t)
(setq org-return-follows-link nil)
(setq org-use-speed-commands t)
(setq org-startup-align-all-tables nil)
(setq org-log-into-drawer nil)
(setq org-tags-column 1)
(setq org-ellipsis " \u25bc" )
(setq org-speed-commands-user nil)
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
(setq org-completion-use-ido t)
(setq org-indent-mode t)
(setq org-startup-truncated nil)
(setq auto-fill-mode -1)
(setq org-html-validation-link nil)
(setq-default fill-column 99999)
(setq fill-column 99999)
(global-auto-revert-mode t)
(prefer-coding-system 'utf-8)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode nil)               ;; No region when it is not highlighted

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (lisp . t)
   (emacs-lisp . nil)
   (shell . t)
   (awk . t)
   (sed . t)
   (latex . t)
   (dot . nil)
   (ditaa . nil)
   (C . t)
   (java . t)
   (python . t)
   (perl . nil)
   (R . nil)
   (ruby . nil)
   (js . t)
   (css . t)
   (sql . t)
   (sqlite . t)
   (makefile . t)
   ))

(defun org-mode-my-init () "ORG-MODE中文输入*和-"
       (define-key org-mode-map (kbd "×") (kbd "*"))
       (define-key org-mode-map (kbd "－") (kbd "-"))
       (setq default-buffer-file-coding-system 'utf-8-unix)
       (setq default-file-name-coding-system 'utf-8)
       (setq default-keyboard-coding-system 'utf-8-unix)
       (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))
(add-hook 'org-mode-hook 'org-mode-my-init)
