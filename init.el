;;; init --- init

;;Package management
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Appearance
(setq inhibit-startup-message t)
(load-theme 'solarized-light t)
(setq visible-bell t)
(set-face-attribute 'default (selected-frame) :height 120)
(column-number-mode t)
(line-number-mode t)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(tool-bar-mode -1)
(global-visual-line-mode t)
(global-visual-fill-column-mode t)

;; Auto complete and projects
(ivy-mode t)
(counsel-mode t)
(global-company-mode t)
(company-quickhelp-mode t)
(global-flycheck-mode)
(projectile-mode t)
(counsel-projectile-mode t)

;; Auto complete
(require 'minimap)
(setq minimap-hide-scroll-bar t
      minimap-highlight-line nil
      minimap-minimum-width 20
      minimap-window-location 'right)

;; Backup
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;;;; Keybinds
(global-unset-key (kbd "C-p"))
(global-unset-key (kbd "M-x"))
(global-set-key (kbd "C-S-p") 'execute-extended-command)

;; Quit
(progn
  (global-set-key [escape] 'keyboard-quit) ;; all platforms?
  (setq w32-quit-key 27) ;; needed in MicroSCOft cages?
)

;; Search
(global-set-key (kbd "C-f") 'swiper)
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l") 'avy-goto-char)
(global-set-key (kbd "C-S-l k") 'avy-goto-word-1)

;; Auto complete
(global-set-key (kbd "M-SPC") 'company-complete)
(global-set-key (kbd "C-/") 'company-complete)
;(global-set-key (kbd "TAB") 'company-complete)

;; Multiple section
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-d") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-d") 'mc/mark-all-like-this)

;; File and buffer
(global-set-key (kbd "C-S-q") 'kill-buffer-and-window)
(global-set-key (kbd "C-q") 'kill-current-buffer)
(global-set-key (kbd "C-o") 'switch-to-buffer)
(global-set-key (kbd "C-S-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)

;; Project
(global-set-key (kbd "C-p") 'counsel-projectile-find-file)

 ;; Appearance
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") '(lambda()(interactive)(text-scale-set 0)))
(global-unset-key (kbd "C-k"))
(global-set-key (kbd "C-k C-m") 'minimap-mode)
(global-set-key (kbd "C-k C-b") 'neotree)

;; CUA
(global-set-key (kbd "C-z") 'undo)
;;(global-set-key (kbd "C-x") 'kill-region)
;;(global-set-key (kbd "C-c") 'kill-ring-save)
;;(global-set-key (kbd "C-v") 'yank)
;;(global-set-key (kbd "M-c") 'mode-specific-map)
;;(global-set-key (kbd "M-x") 'ctl-x-map)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multiple-cursors yaml-mode ansible visual-fill-column use-package solarized-theme neotree minimap magit flycheck evil elpy counsel-projectile company-quickhelp auctex all-the-icons ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

