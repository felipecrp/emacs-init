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

;; file manipulation
;;(global-set-key (kbd "C-s") 'save-buffer)
(defun empty-buffer()
  (interactive)
  (switch-to-buffer (generate-new-buffer "untitled")))

(defun empty-frame()
  (interactive)
  (switch-to-buffer-other-frame (generate-new-buffer "untitled")))

(global-set-key (kbd "C-t") 'empty-buffer)
(global-set-key (kbd "C-n") 'empty-frame)
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
;; (todo) assign frame and buffer relation, like modern editor tabs

;; search
(global-set-key (kbd "C-f") 'isearch-forward)

;;; navigation - based on ergonomic emacs - http://ergoemacs.org/emacs/ergonomic_emacs_keybinding.html
;; move by char
(global-set-key (kbd "M-j") 'backward-char) 
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
;; move by word
(global-set-key (kbd "C-M-j") 'backward-word)
(global-set-key (kbd "C-M-l") 'forward-word)
;; move begin/line
(global-set-key (kbd "M-u") 'back-to-indentation) ;; 'move-beginning-of-line)
(global-set-key (kbd "M-o") 'move-end-of-line)
;; move paragraph
(global-set-key (kbd "C-M-i") 'backward-paragraph)
(global-set-key (kbd "C-M-k") 'forward-paragraph)

;;; delete
(global-set-key (kbd "M-s-j") 'delete-backward-char) 
(global-set-key (kbd "M-s-l") 'delete-char)
(global-set-key (kbd "C-M-s-j") 'backward-kill-word)
(global-set-key (kbd "C-M-s-l") 'kill-word)
;;(global-set-key (kbd "M-s-u") 'kill-line-backward)
(global-set-key (kbd "M-s-o") 'kill-line)

;;; Cancel
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; mutiple selection
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
(global-set-key (kbd "M-w") 'delete-window)
;;  (lambda () (interactive) (kill-this-buffer) (delete-window)))

(defun delete-frame-or-kill-emacs()
  "Delete the selected frame.  If the last one, kill Emacs."
  (interactive)
  (condition-case nil (delete-frame) (error (save-buffers-kill-terminal))))
(global-set-key (kbd "M-<f4>") 'delete-frame)

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

