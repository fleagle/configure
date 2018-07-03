;;; init-capture.el ---

;; Copyright 2016 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-capture.el,v 0.0 2016/12/09 01:55:45 zachary Exp $
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-capture)

;;; Code:

(provide 'init-capture)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
(require-package 'org-journal)
(require-package 'org-plus-contrib)

(require 'org-journal)
(require 'org)
;;(message (format-time-string "notes_%Y-%m-%d.org"))

;;Setting for gtd capture
;;Directory for capture files
(setq org-gtd-directory "~/Documents/org-project/gtd/")
(setq org-agenda-files (list "~/Documents/org-project/gtd/org/inbox.org"
                             "~/Documents/org-project/gtd/org/projects.org"
                             "~/Documents/org-project/gtd/org/notes.org"
                             "~/Documents/org-project/gtd/org/journal.org"))
;;Default capture file
(setq org-default-notes-file "~/Documents/org-project/gtd/org/inbox.org")

(setq org-use-fast-todo-selection t)
;;除了上述内容以外，Org mode 还允许定义进入状态和离开状态时的额外动作，可用的动作包含两个:
;;添加笔记和状态变更信息(包括时间信息)，用"@"表示
;;只添加状态变更信息，用"!"表示
;;这个通过定义带快速选择键的关键词时，在快速选择键后用"X/Y"来表示，X表示进入该状态时的动作，Y表示离开该状态时的动作。对于一个状态(以"DONE"为例)，以下形式都是合法的:
;;DONE(d@)       ; 进入时添加笔记
;;DONE(d/!)      ; 离开时添加变更信息
;;DONE(d@/!)     ; 进入时添加笔记，离开时添加变更信息
;;而这个是不合法的:
;;DONE(d@/)
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROCESS(i)" "WAITING(w@/!)" "|" "DONE(d@/!)" "CANCELED(c@/!)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k@/!)" "POSTPONED(p@/!)" "|" "NOT-REPRO(n!)" "DUPLICATE(u@/!)" "WON'T-FIX(w@/!)" "FIXED(f@/!)")
        ))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("IN-PROGRESS" :foreground "yellow" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("DONE" :foreground "green" :weight bold)
              ("CANCELED" :foreground "green" :weight bold)
              ("REPORT" :foreground "red" :weight bold)
              ("BUG" :foreground "red" :weight bold)
              ("KNOWNCAUSE" :foreground "yellow" :weight bold)
              ("POSTONED" :foreground "orange" :weight bold)
              ("NOT-REPRO" :foreground "green" :weight bold)
              ("Duplicate" :Foreground "green" :weight bold)
              ("WON'T-FIX" :foreground "green" :weight bold)
              ("FIXED" :foreground "green" :weight bold)
              )))

(setq org-tag-alist '(
                      (:startgroup . nil)
                      ("Home" . ?h)("Office" . ?o)("way" . ?w)
                      (:endgroup)
                      ))

(setq org-capture-templates '(
                              ("t" "Todo" entry (file+headline "~/Documents/org-project/gtd/org/inbox.org" "Tasks")
                               "* TODO %?\nTime:%T\n")
                              ("p" "Projects" entry (file+headline "~/Documents/org-project/gtd/org/projects.org" "Projects")
                               "* %?\nTime:%U\n")
                              ("m" "Misc notes" plain (file+datetree "~/Documents/org-project/gtd/org/notes.org" "Notes")
                               "**** %?\n----------------------------\nTime:%U\n")
                              ("j" "Journal Entry"
                               entry (file+datetree "~/Documents/org-project/gtd/org/journal.org")
                               "* %?"
                               :empty-lines 1)
                              ))

;; capture
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))
(define-key global-map "\C-cp"
  (lambda () (interactive) (org-capture nil "p")))
(define-key global-map "\C-cj"
  (lambda () (interactive) (org-capture nil "j")))
(define-key global-map "\C-cm"
  (lambda () (interactive) (org-capture nil "m")))

;;; init-capture.el ends here
