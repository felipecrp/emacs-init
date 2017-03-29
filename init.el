;;; Package management
(package-initialize)
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;; Appearance
;; Toolbar, beep and startup
(tool-bar-mode -1)
(setq visible-bell 1)
(setq inhibit-startup-message t)

;; line and column  number
(global-linum-mode 1)
(setq linum-format "%4d \u2502")
(column-number-mode 1)
(line-number-mode 1)
(global-hl-line-mode 1)

;; font
(add-to-list 'default-frame-alist '(font . "Courier New-12"))
(set-face-attribute 'default t :font "Courier New-12")

;; don´t truncate lines
(set-default 'truncate-lines t)

;; Theme
(require 'solarized-theme)
(load-theme 'solarized-light t)

;;; key binding
;; left windows key
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super)

;; run emacs function
(require 'helm)
(global-set-key (kbd "C-S-p") 'helm-M-x)
(global-unset-key (kbd "M-x"))

;; modern binding
(cua-mode t)
;;(global-set-key (kbd "C-z")  'undo)

;; navigation - based on ergonomic emacs - http://ergoemacs.org/emacs/ergonomic_emacs_keybinding.html

;; file manipulation
;;(global-set-key (kbd "C-s") 'save-buffer)

;; mutiple selection
(require 'multiple-cursors)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-d") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "M-S-d") 'mark-all-like-this)

;; drag text
(require 'drag-stuff)
(drag-stuff-global-mode 1)
(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)

;; window and frame  management
(require 'frame-cmds)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-4") 'make-frame-command)
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "M-w") 'delete-window)
;;  (lambda () (interactive) (kill-this-buffer) (delete-window)))

(defun delete-frame-or-kill-emacs()
  "Delete the selected frame.  If the last one, kill Emacs."
  (interactive)
  (condition-case nil (delete-frame) (error (save-buffers-kill-terminal))))
(global-set-key (kbd "M-<f4>") 'delete-frame-or-kill-emacs)

;; window and frame navigation
(require 'windmove)
(global-set-key (kbd "M-s-<left>")  'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<up>")    'windmove-up)
(global-set-key (kbd "M-s-<down>")  'windmove-down)
(require 'framemove)
(setq framemove-hook-into-windmove t)

;;; Syntax complete
(electric-pair-mode 1)
(electric-quote-mode 1)

;;; Syntax highlight
(show-paren-mode 1)

