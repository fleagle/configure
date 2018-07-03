(provide 'init-org-project)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
(require-package 'htmlize)

(require 'org)
(require 'htmlize)
(require 'ox-publish)

;;;; Global dir define
;;(setq org-work-base-directory "~/Documents/org/")
;;(setq org-blog-base-directory (concat org-work-base-directory "blog/"))
;;(setq org-gtd-base-directory (concat org-work-base-directory "gtd/"))


(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory  "~/Documents/org-project/blog/org/"
         :base-extension "org"
         :publishing-directory "~/Documents/org-project/blog/publish/"
         :publishing-function org-html-publish-to-html
         :recursive t
         :headline-levels 5   ;just the default for this project
         :section-numbers nil
;         :export-creator-info nil    ; Disable the inclusion of "Created by Org".
;         :export-author-info nil     ; Disables the inclusion of "Author: Your Name".
         :table-of-contents nil      ; Set this to "t" if you want a table of contents.
         :auto-sitemap t     ;; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ;; ... call it sitemap.org(it's the default)
         :sitemap-title "sitemap" ;; ... with title 'Sitemap'
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%d %t"
         :html-doctype "html5"
         :html-html5-fancy t
         ;; Do not include predefined header scripts.
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head  "<link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/css/worg.css\"/>"
         :html-head-extra ""
         :auto-preamble t
         :auto-postamble t
         :html-preamble "<div class=\"nav\">
                          <ul>
                             <li><a href=\"/index.html\">Index</a></li>
                             <li><a href=\"/about.html\">About</a></li>
                             <li><a href=\"/sitemap.html\">SiteMap</a></li>
                          </ul>
                        </div>"
;         :html-preamble ,(with-temp-buffer (insert-file-contents (concat blog-org-dir "/assets/preamble.html")) (buffer-string))
;         :html-postamble ,(with-temp-buffer (insert-file-contents (concat blog-org-dir "/assets/postamble.html")) (buffer-string))
         )
        ("blog-static"
         :base-directory "~/Documents/org-project/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
         :publishing-directory "~/Documents/org-project/blog/publish"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("gtd-notes"
         :base-directory  "~/Documents/org-project/gtd/org/"
         :base-extension "org"
         :publishing-directory "~/Documents/org-project/gtd/publish/"
         :publishing-function org-html-publish-to-html
         :recursive t
         :headline-levels 5   ;just the default for this project
         :section-numbers nil
;         :export-creator-info nil    ; Disable the inclusion of "Created by Org".
;         :export-author-info nil     ; Disables the inclusion of "Author: Your Name".
         :table-of-contents nil      ; Set this to "t" if you want a table of contents.
         :auto-sitemap t     ;; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ;; ... call it sitemap.org(it's the default)
         :sitemap-title "sitemap" ;; ... with title 'Sitemap'
         :html-doctype "html5"
         :html-html5-fancy t
         ;; Do not include predefined header scripts.
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head  "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/worg.css\"/>"
         :html-head-extra ""
         :auto-preamble t
         :auto-postamble t
         :html-preamble "<div class=\"nav\">
                          <ul>
                             <li><a href=\"index.html\">Index</a></li>
                             <li><a href=\"about.html\">About</a></li>
                             <li><a href=\"sitemap.html\">SiteMap</a></li>
                          </ul>
                        </div>"
;         :html-preamble ,(with-temp-buffer (insert-file-contents (concat blog-org-dir "/assets/preamble.html")) (buffer-string))
;         :html-postamble ,(with-temp-buffer (insert-file-contents (concat blog-org-dir "/assets/postamble.html")) (buffer-string))
         )
        ("gtd-static"
         :base-directory "~/Documents/org-project/gtd/org"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
         :publishing-directory "~/Documents/org-project/gtd/publish"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog":components("blog-notes" "blog-static"))
        ("gtd":components("gtd-notes" "gtd-static"))
        ;;
        )
      )

(defun publish-project (project no-cache)
  (interactive "sName of project: \nsNo-cache?[y/n] ")
  (if (or (string= no-cache "y")
          (string= no-cache "Y"))
      (setq org-publish-use-timestamps-flag nil))
  (org-publish-project project)
  (setq org-publish-use-timestamps-flag t))
