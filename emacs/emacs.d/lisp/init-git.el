;;; init-git.el --- 

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-git.el,v 0.0 2018/06/29 11:32:43 zachary Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.init-git:
;;   (require 'init-git)

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(provide 'init-git)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; TODO: link commits from vc-log to magit-show-commit
;; TODO: smerge-mode
(require-package 'git-blamed)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(maybe-require-package 'git-timemachine)


(when (maybe-require-package 'magit)
  (setq-default magit-diff-refine-hunk t)

  ;; Hint: customize `magit-repository-directories' so that you can use C-u M-F12 to
  ;; quickly open magit on any one of your projects.
  (global-set-key [(meta f12)] 'magit-status)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup))

(after-load 'magit
  (define-key magit-status-mode-map (kbd "C-M-<up>") 'magit-section-up)
  (add-hook 'magit-popup-mode-hook 'sanityinc/no-trailing-whitespace))

(require-package 'fullframe)
(after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

(when (maybe-require-package 'git-commit)
  (add-hook 'git-commit-mode-hook 'goto-address-mode))


;; Convenient binding for vc-git-grep
(after-load 'vc
  (define-key vc-prefix-map (kbd "f") 'vc-git-grep))

;;; git-svn support

;; (when (maybe-require-package 'magit-svn)
;;   (require-package 'magit-svn)
;;   (autoload 'magit-svn-enabled "magit-svn")
;;   (defun sanityinc/maybe-enable-magit-svn-mode ()
;;     (when (magit-svn-enabled)
;;       (magit-svn-mode)))
;;   (add-hook 'magit-status-mode-hook #'sanityinc/maybe-enable-magit-svn-mode))

(after-load 'compile
  (dolist (defn (list '(git-svn-updated "^\t[A-Z]\t\\(.*\\)$" 1 nil nil 0 1)
                      '(git-svn-needs-update "^\\(.*\\): needs update$" 1 nil nil 2 1)))
    (add-to-list 'compilation-error-regexp-alist-alist defn)
    (add-to-list 'compilation-error-regexp-alist (car defn))))

(defvar git-svn--available-commands nil "Cached list of git svn subcommands")
(defun git-svn--available-commands ()
  (or git-svn--available-commands
      (setq git-svn--available-commands
            (sanityinc/string-all-matches
             "^  \\([a-z\\-]+\\) +"
             (shell-command-to-string "git svn help") 1))))

(autoload 'vc-git-root "vc-git")

(defun git-svn (dir command)
  "Run a git svn subcommand in DIR."
  (interactive (list (read-directory-name "Directory: ")
                     (completing-read "git-svn command: " (git-svn--available-commands) nil t nil nil (git-svn--available-commands))))
  (let* ((default-directory (vc-git-root dir))
         (compilation-buffer-name-function (lambda (major-mode-name) "*git-svn*")))
    (compile (concat "git svn " command))))


(maybe-require-package 'git-messenger)
;; Though see also vc-annotate's "n" & "p" bindings
(after-load 'vc
  (setq git-messenger:show-detail t)
  (define-key vc-prefix-map (kbd "p") #'git-messenger:popup-message))
