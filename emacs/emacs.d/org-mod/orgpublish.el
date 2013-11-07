;;; orgpublish.el --- 

;; Copyright 2013 Zachary.Ma
;;
;; Author: mapeng@innofidei.com
;; Version: $Id: orgpublish.el,v 0.0 2013/10/12 07:38:11 zachary Exp $
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
;;   (require 'orgpublish)

;;; Code:

(provide 'orgpublish)
(eval-when-compile
  (require 'cl))
(require 'org-publish)




;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(setq org-publish-project-alist
      '((
         "org-notes"
         :base-directory "~/documents/notes/org/"
         :base-extension "org"
         :publishing-directory "~/documents/notes/html/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4 ;just the default for this project
         :auto-preamble t
         :auto-sitemap t  ;自动生成sitemap.org
         :sitemap-title "Sitemap"
         :export-creator-info nil ;禁止在postamble显示created by org
         :export-author-info nil ;禁止在postamble显示Author: your name
         :auto-postamble nil
         :table-of-contents nil  ;禁止生成文章目录
         :section-numbers nil ;禁止生产段落标题前面用数字
         :html-postamble "<p class=\"postamble\">Update time: %d.</p>" ;自定义postamble显示字样
         :style-include-default nil ;禁止默认css演示，使用自定义css
         )
         (
          "org-static"
          :base-directory "~/documents/notes/org/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "~/documents/notes/html/"
          :recursive t
          :publishing-function org-publish-attachment
         )
     ("org" :components ("org-notes" "org-static"))
))




;;; orgpublish.el ends here
