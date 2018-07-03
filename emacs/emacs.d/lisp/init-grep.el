;;; init-grep.el ---

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-grep.el,v 0.0 2018/06/29 15:35:03 zachary Exp $
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
;;   (require 'init-grep)

;;; Code:

(provide 'init-grep)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(setq-default grep-highlight-matches t
              grep-scroll-output t)

(when (and (executable-find "ag")
           (maybe-require-package 'ag))
  (require-package 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "M-?") 'ag-project))

(when (and (executable-find "rg")
           (maybe-require-package 'rg))
  (global-set-key (kbd "M-?") 'rg-project))



;;; init-grep.el ends here
