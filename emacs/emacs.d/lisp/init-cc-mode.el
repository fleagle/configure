;;; C/C++ Configuration

;;; code hide
;; (load-library "hideshow")
;; (add-hook 'c-mode-hook 'hs-minor-mode)
;; (add-hook 'c++-mode-hook 'hs-minor-mode)
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s     show block
;; C-c @ C-h     hide block
;; C-c @ C-c     toggle hide/show

;;; c and c++ style
;; tables instead of spaces

(provide 'init-cc-mode)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

;;; c/c++ header complete
(require-package 'company-c-headers)

;; add company-c-headers to company mode
(defun company-c-headers-setup ()
  (add-to-list 'company-backends 'company-c-headers))

(defun ede-object-system-include-path ()
  (when ede-object
    (ede-system-include-path ede-object)))
(setq company-c-headers-path-system 'ede-object-system-include-path)

(setq header-custom-file (expand-file-name "cc-mode-header-custom.el" user-emacs-directory))
(when (file-exists-p header-custom-file)
  (load header-custom-file))

;;; CEDET Configuration
(require 'semantic)
(global-ede-mode 1)

(defun semantic-enable ()
  "Enable semantic."
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (semantic-mode 1)
  )

(defun semantic-disable ()
  "Disable semantic."
  (global-semanticdb-minor-mode nil)
  (global-semantic-idle-scheduler-mode nil)
  (semantic-mode -1)
  )

(setq ede-custom-file (expand-file-name "cc-mode-projects.el" user-emacs-directory))
(when (file-exists-p ede-custom-file)
  (load ede-custom-file))

;; remove semantic for python mode and html mode
(setq semantic-new-buffer-setup-functions
      (remove-if (lambda (buffer-setup-function)
                   (member (car buffer-setup-function)
                           '(python-mode html-mode)))
                 semantic-new-buffer-setup-functions))

(remove-hook 'python-mode-hook 'wisent-python-default-setup)

;; set SemanticDB search throttle
;; (setq-mode-local c-mode
;;                               semanticdb-find-default-throttle
;;                               '(project unloaded recursive))
;; (setq-mode-local c++-mode
;;                               semanticdb-find-default-throttle
;;                               '(project unloaded recursive))

;; add company-semantic to company mode
(defun company-semantic-setup ()
  "Configure company-backends for company-semantic and company-yasnippet."
  (delete 'company-irony company-backends)
  (push '(company-semantic :with company-yasnippet) company-backends)
  ;; (add-to-list 'company-backends 'company-semantic)
  )

;;; RTags configuration
(require-package 'rtags)

(rtags-enable-standard-keybindings)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)

;;; Irony reconfiguration
(require-package 'irony)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require-package 'company-irony)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-irony-ignore-case 'smart)
(defun company-irony-setup ()
  "Configure company-backends for company-irony."
  (delete 'company-semantic company-backends)
  (push '(company-irony :with company-yasnippet) company-backends))
;; irony-c-headers
(require-package 'company-irony-c-headers)
(defun company-irony-c-headers-setup ()
  "Configure company-backends for company-irony-c-headers."
  (add-to-list 'company-backends 'company-irony-c-headers))
;; flycheck-irony
(require-package 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


;;; Selection between CEDET and RTags
(defun cedet-enable ()
  "Start CEDET."
  (interactive)
  (remove-hook 'c++-mode-hook 'irony-mode)
  (remove-hook 'c-mode-hook 'irony-mode)
  (remove-hook 'c++-mode-hook 'company-irony-c-headers-setup)
  (remove-hook 'c-mode-hook 'company-irony-c-headers-setup)
  (remove-hook 'c++-mode-hook 'company-irony-setup)
  (remove-hook 'c-mode-hook 'company-irony-setup)
  (semantic-enable)
  (add-hook 'c++-mode-hook 'company-c-headers-setup)
  (add-hook 'c-mode-hook 'company-c-headers-setup)
  (add-hook 'c++-mode-hook 'company-semantic-setup)
  (add-hook 'c-mode-hook 'company-semantic-setup)
  )

(defun irony-enable ()
  "Start irony mode."
  (interactive)
  (semantic-disable)
  (remove-hook 'c++-mode-hook 'company-c-headers-setup)
  (remove-hook 'c-mode-hook 'company-c-headers-setup)
  (remove-hook 'c++-mode-hook 'company-semantic-setup)
  (remove-hook 'c-mode-hook 'company-semantic-setup)
  (rtags-start-process-unless-running)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'company-irony-c-headers-setup)
  (add-hook 'c-mode-hook 'company-irony-c-headers-setup)
  (add-hook 'c++-mode-hook 'company-irony-setup)
  (add-hook 'c-mode-hook 'company-irony-setup)
  )

;;; CMake configuration
(require-package 'cmake-mode)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(defun company-cmake-setup ()
  (add-to-list 'company-backends 'company-cmake))
(add-hook 'cmake-mode-hook 'company-cmake-setup)

;;; clang-format configuration
(require-package 'clang-format)
;; required when use a specific version of clang-format
;; (setq clang-format-executable "/usr/bin/clang-format-3.8")
;; clang-format the buffer when saving a file
(defun clang-format-on-save ()
  (add-hook 'before-save-hook #'clang-format-buffer nil 'local))
(add-hook 'c++-mode-hook 'clang-format-on-save)
(add-hook 'c-mode-hook 'clang-format-on-save)
