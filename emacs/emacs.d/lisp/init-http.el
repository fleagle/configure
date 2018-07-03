(provide 'init-http)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################
(maybe-require-package 'httprepl)
(when (maybe-require-package 'restclient)
  (add-auto-mode 'restclient-mode "\\.rest\\'")

  (defun sanityinc/restclient ()
    (interactive)
    (with-current-buffer (get-buffer-create "*restclient*")
      (restclient-mode)
      (pop-to-buffer (current-buffer)))))
