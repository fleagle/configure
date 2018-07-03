;;; global.el ---

;; Copyright 2018 Zachary.Ma
;;
;; Author: fleagle236@gmail.com
;; Version: $Id: global.el,v 0.0 2018/06/29 11:34:48 zachary Exp $
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
;;   (require 'global)

;;; Code:

(provide 'global)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'electric)

;;=====================================
;; 个人信息设置
;;=====================================
(setq user-full-name "Zachary.Ma")
(setq user-mail-address "fleagle236@gmail.com")

;;======================================
;; 外观设
;;======================================
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
;; 启动emacs时窗口最大化
(init-maximized)
;;去掉工具栏、菜单栏和侧边滚动条
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; no splash screen
(setq inhibit-splash-screen t)
;;在标题栏显示buffer名字
(setq frame-title-format "emacs@%b")
;;关闭启动开机画面
(setq inhibit-startup-message t)
;;关闭错误提示声音
(setq visible-bell t)
;;显示时间
(display-time-mode 1)
;;时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;======================================
;; 缓冲区
;;======================================
;;缺省模式text-mode
(setq default-major-mode 'text-mode)
;;显示行号
(global-linum-mode t)
;;显示列号
(setq column-number-mode t)
;;设定行距
(setq default-line-spacing 0)
;;高亮显示当前行
;;(global-hl-line-mode 1)
;;高亮显示区域选择
(transient-mark-mode t)
;;光标靠近鼠标指针时，让鼠标自动让开，别当住视线
(setq mouse-yank-at-point t)
;;防止页面滚动时跳动，scroll-margin 3可以在靠近屏幕3行时开始滚动
(setq scroll-margin 3
	  scroll-conservatively 10000)
;; 设置kill ring
(setq kill-ring-max 200)
;;语法加亮
(global-font-lock-mode t)
;;tab键替换为空格
(setq-default indent-tabs-mode nil)
;;换行后自动缩进
(global-set-key (kbd "RET") 'newline-and-indent)
;;显示匹配的括号
(show-paren-mode t)
;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;编辑时智能缩进，类似于C-j的效果——这个C-j中，zencoding和electric-pair-mode冲突
(electric-indent-mode t)
;;系统本身内置的智能自动补全括号
(electric-pair-mode t)
;;特定条件下插入新行
(electric-layout-mode t)

;;emacs 支持外部程序粘贴拷贝
(setq x-select-enable-clipbord t)
;;可以直接打开图片
(auto-image-file-mode t)
;;设置 Org 文件自动换行
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))


;;=========================================
;; 自动备份
;;=========================================
;;关闭备份文件
(setq make-backup-files nil)
;;自动备份
;(setq auto-save-timeout 300)
;(setq make-backup-files t)
;(setq
;    backup-by-copying t ; 自动备份
;    backup-directory-alist
;    '(("." . "~/.emacs.d/auto-save-list/")) ; 自动备份在目录"~/.saves"下
;    delete-old-versions t ; 自动删除旧的备份文件
;    kept-new-versions 1 ; 保留最近的1个备份文件
;    kept-old-versions 2 ; 保留最早的2个备份文件
;    version-control t) ; 多次备份

;;=========================================
;; Shell窗口
;;=========================================
;;退出shell字段关闭shell-buffer
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


;;======================================
;;快捷键定义
;;======================================
;;buffer中运行脚本快捷键
(global-set-key (kbd "<f5>") 'run-current-file)
;; 切换行距快捷键
(global-set-key (kbd "<f7>") 'toggle-line-spacing)
;; Toggle mode between PHP & Web-Mode Helper modes
(global-set-key (kbd "<f9>") 'toggle-auto-flavor-mode)
;; rename current buffer
(global-set-key (kbd "<f10>") 'rename-buffer)
;; 启动全屏的快捷键
(global-set-key [f11] 'show-fullscreen)
;;打开shell-mode
(global-set-key (kbd "C-c z") 'shell)

;; Wind-move
;;(global-set-key (kbd "C-c j") 'windmove-up)
;;(global-set-key (kbd "C-c k") 'windmove-down)
;;(global-set-key (kbd "C-c l") 'windmove-left)
;;(global-set-key (kbd "C-c ;") 'windmove-right)

;; publish projects
;;(global-set-key (kbd "<f8> p") 'org-publish)

;;; global.el ends here
