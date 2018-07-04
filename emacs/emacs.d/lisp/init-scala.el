(provide 'init-scala)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require-package 'ensime)
(require-package 'sbt-mode)
(require-package 'scala-mode)

(add-to-list 'auto-mode-alist '(".scala$" . scala-mode))
(add-to-list 'auto-mode-alist '(".sbt$" . scala-mode))

(add-hook 'scala-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'compile-sbt-project)))
