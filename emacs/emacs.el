;;; .emacs ---

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: emacs.el,v 0.0 2018/06/29 11:32:43 zachary Exp $
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
;;   (require 'emacs)

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(provide 'emacs)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; -*- lexical-binding: t -*-
(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'global)
(require 'init-elpa) ;; Machinery for installing required packages

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-package 'wgrep)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-windows)
(require 'init-gui-frames)
(require 'init-frame-hooks)
(require 'init-fonts)
(require 'init-themes)
(require 'init-ibuffer)
(require 'init-uniquify) ;; same name buffer
(require 'init-recentf)
(require 'init-smex)
(require 'init-ivy)
(require 'init-yasnippet)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-company-math)

(require 'init-isearch)
(require 'init-grep)
;(require 'init-editing-utils)
(require 'init-whitespace)
;;
;;(require 'init-xterm)
;(require 'init-dired)
;;;; lisp
;(require 'init-paredit)
;(require 'init-lisp)
;(require 'init-slime)
;(require 'init-common-lisp)
;;; dev tools
(require 'init-git)
(require 'init-vc)
(require 'init-darcs)
;;;; text
;(require 'init-capture)
;(require 'init-org-mode)
;(require 'init-org-project)
;;;; dev
;;(require 'init-projectile)
;;(require 'init-nxml)
;;(require 'init-csv)
(require 'init-sql)
(require 'init-yaml)
;;(require 'init-http)
(require 'init-web-mode)
(require 'init-javascript)
(require 'init-css)
(require 'init-php)
;(require 'init-python)
;(require 'init-cc-mode)
(require 'init-scala)

;;;;;; emacs.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ensime company-php smarty-mode php-mode css-eldoc skewer-less less-css-mode sass-mode mmm-mode rainbow-mode add-node-modules-path skewer-mode js-comint prettier-js typescript-mode coffee-mode js2-mode json-mode web-mode yaml-mode vc-darcs darcsum browse-at-remote diff-hl git-messenger magit git-timemachine gitconfig-mode gitignore-mode git-blamed whitespace-cleanup-mode anzu company-math company-quickhelp company yasnippet-snippets yasnippet ivy-xref projectile counsel ivy-historian ivy smex ibuffer-vc rainbow-delimiters color-theme disable-mouse switch-window command-log-mode scratch diminish wgrep fullframe))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1"))))
 '(web-mode-current-element-highlight-face ((t (:foreground "#FF8A4B"))))
 '(web-mode-html-tag-face ((t (:foreground "#729fcf")))))
