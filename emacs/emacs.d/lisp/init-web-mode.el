(provide 'init-web-mode)
(eval-when-compile
  (require 'cl))




;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require-package 'web-mode)

;; Baisc
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.*tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.*tml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

;; Engines
(setq web-mode-engines-alist
      '(
        ("php" . "\\.phtml\\'")
        ("blade" . "\\.blade\\'")
        ("django" . "\\.[sd]tpl\\'")
        ("django" . "\\.[sd]tml\\'")
        ))

;; Settings
(setq-default web-mode-enable-auto-pairing t
              web-mode-enable-auto-opening t
              web-mode-enable-auto-indentation t
              web-mode-enable-block-face t
              web-mode-enable-part-face t
              web-mode-enable-comment-keywords t
              web-mode-enable-css-colorization t
              web-mode-enable-current-element-highlight t
              web-mode-enable-heredoc-fontification t
              web-mode-enable-engine-detection t
              web-mode-markup-indent-offset 2
              web-mode-css-indent-offset 2
              web-mode-code-indent-offset 2
              web-mode-style-padding 2
              web-mode-script-padding 2
              web-mode-block-padding 0
              web-mode-comment-style 2)

;; Custom web-mode colors
(custom-set-faces
 '(web-mode-html-tag-face
   ((t (:foreground "#729fcf"))))
 ;; '(web-mode-html-tag-bracket-face
 ;;   ((t (:foreground "#FFE84B"))))
 '(web-mode-current-element-highlight-face
   ((t (:foreground "#FF8A4B"))))
 '(web-mode-current-element-highlight-face
   ((t (:background "#ffffff"
                    :foreground "#FF8A4B")))))

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil))
               )))

(setq web-mode-ac-sources-alist
      '(("html" . (ac-source-words-in-buffer ac-source-abbrev ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
        ("css" . (ac-source-words-in-buffer ac-source-abbrev ac-source-css-property ac-source-emmet-css-snippets))
        ))

;; New lines are always indented
(global-set-key (kbd "RET") 'newline-and-indent)

(add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'html-mode)))
