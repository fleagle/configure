;;; init-hippie-expand.el --- 

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-hippie-expand.el,v 0.0 2018/06/29 15:47:42 zachary Exp $
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
;;   (require 'init-hippie-expand)

;;; Code:

(provide 'init-hippie-expand)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(global-set-key (kbd "M-/") 'hippie-expand)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hippie expand.  Groovy vans with tie-dyes.

;; Change the default hippie-expand order and add yasnippet to the front.
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-line
        try-complete-file-name-partially
        try-complete-lisp-symbol-partially
        try-complete-file-name
        try-complete-lisp-symbol))

;; Helps when debugging which try-function expanded
(setq hippie-expand-verbose t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart Tab

(defvar smart-tab-using-hippie-expand t
  "turn this on if you want to use hippie-expand completion.")

(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
  minibuffer compliant: it acts as usual in the minibuffer.
  In all other buffers: if PREFIX is \\[universal-argument], calls
  `smart-indent'. Else if point is at the end of a symbol,
  expands it. Else calls `smart-indent'."
  (interactive "P")
  (labels ((smart-tab-must-expand (&optional prefix)
                                  (unless (or (consp prefix)
                                              mark-active)
                                    (looking-at "\\_>"))))
    (cond ((minibufferp)
           (minibuffer-complete))
          ((smart-tab-must-expand prefix)
           (if smart-tab-using-hippie-expand
               (hippie-expand prefix)
             (dabbrev-expand prefix)))
          ((smart-indent)))))

(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
    (indent-region (region-beginning)
                   (region-end))
    (indent-for-tab-command)))




;;; init-hippie-expand.el ends here
