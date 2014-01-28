;;=================================
;; 
;; @(#)global.el
;; Author: Zachary.Ma
;; Date: 25 Apr 2013
;; Discription: Zachary's emacs config file.
;;
;;=================================

(provide 'global)

(require 'custom_function)
;;=====================================
;; 个人信息设置
;;=====================================

(setq user-full-name "Zachary.Ma")
(setq user-mail-address "mapeng@innofidei.com")

;;======================================
;; 外观设
;;======================================

;;去掉工具栏、菜单栏和侧边滚动条
;(menu-bar-mode nil)
(tool-bar-mode nil)
;(if(fboundp 'tool-bar-mode)
;   (tool-bar-mode -1))

;;在标题栏显示buffer名字
(setq frame-title-format "emacs@%b")

;;关闭启动开机画面
(setq inhibit-startup-message t)

;;关闭错误提示声音
(setq visible-bell t)

;; 启动emacs时窗口最大化
(my-maximized)

;;窗口快捷键
;;多窗口时，关闭其他窗口后C-c <-恢复已经关闭的窗口
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 


;;==============================================
;; 状态栏
;;==============================================

;;显示时间
(display-time-mode 1)
;;时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;======================================
;;快捷键定义
;;======================================
;; 启动全屏的快捷键
(global-set-key [f11] 'my-fullscreen)

;;buffer中运行脚本快捷键
(global-set-key [f5] 'run-current-file)

;;打开shell-mode
(global-set-key (kbd "C-c z") 'shell) 
(global-set-key (kbd "<f10>") 'rename-buffer)

;;支持注释/反注释代码
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)

;;======================================
;; 缓冲区
;;======================================

;;关闭备份文件
;; (setq make-backup-files nil)

;;自动备份
(setq auto-save-timeout 300)  
(setq make-backup-files t)  
(setq  
    backup-by-copying t ; 自动备份  
    backup-directory-alist  
    '(("." . "~/.emacs.d/auto-save-list/")) ; 自动备份在目录"~/.saves"下  
    delete-old-versions t ; 自动删除旧的备份文件  
    kept-new-versions 1 ; 保留最近的1个备份文件  
    kept-old-versions 2 ; 保留最早的2个备份文件  
    version-control t) ; 多次备份  

;;缺省模式text-mode
(setq default-major-mode 'text-mode)

;;显示行号
(global-linum-mode t)

;;显示列号
(setq column-number-mode t)

;;设定行距
(setq default-line-spacing 0)

;;显示匹配的括号
(show-paren-mode t)

;;语法加亮
(global-font-lock-mode t)

;;高亮显示当前行
;(global-hl-line-mode 1)

;;换行后自动缩进
(global-set-key (kbd "RET") 'newline-and-indent)

;;tab键替换为空格
(setq-default indent-tabs-mode nil)

;;高亮显示区域选择
(transient-mark-mode t)

;;光标靠近鼠标指针时，让鼠标自动让开，别当住视线
(setq mouse-yank-at-point t)

;; 设置kill ring
(setq kill-ring-max 200)

;;emacs 支持外部程序粘贴拷贝
(setq x-select-enable-clipbord t)

;;防止页面滚动时跳动，scroll-margin 3可以在靠近屏幕3行时开始滚动
(setq scroll-margin 3
	  scroll-conservatively 10000)

;;可以直接打开图片
(auto-image-file-mode t)

;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;推出shell字段关闭shell-buffer
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit)
      )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))


;;启动外置chrome浏览器设置
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "Chrome")
