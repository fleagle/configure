;;; init-fonts.el ---

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: init-fonts.el,v 0.0 2018/06/29 15:52:24 zachary Exp $
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
;;   (require 'init-fonts)

;;; Code:

(provide 'init-fonts)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
;;; Changing font sizes

;;字体设置
(set-language-environment "UTF-8")
(set-locale-environment "UTF-8")
(set-default-font "-bitstream-Courier 10 Pitch-bold-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(setq-default truncate-lines 1) ;; no wordwrap





;;; init-fonts.el ends here
