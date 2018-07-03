(provide 'init-csv)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require-package 'csv-mode)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))
