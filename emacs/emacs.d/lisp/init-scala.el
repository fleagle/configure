(provide 'init-scala)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require-package 'ensime)
(require-package 'sbt-mode)
(require-package 'scala-mode)

(require 'scala-mode)
(require 'ensime)
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(require 'sbt-mode)

(add-hook 'scala-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'compile-sbt-project)))
