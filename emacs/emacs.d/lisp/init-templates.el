;;; init-templates.el --- 

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-templates.el,v 0.0 2018/06/29 11:32:43 zachary Exp $
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

;; Put this file into your load-path and the following into your ~/.init-templates:
;;   (require 'init-templates)

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(provide 'init-templates)
(eval-when-compile
  (require 'cl))

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'template)
(template-initialize)
(add-to-list
 'template-expansion-alist
 '("GUIID" (insert (substring (shell-command-to-string "uuidgen") 0 -1))))
(setq template-default-directories (cons "~/.emacs.d/templates/" template-default-directories))
(add-to-list 'template-find-file-commands
	                 'ido-exit-minibuffer)




;;; init-templates.el ends here
