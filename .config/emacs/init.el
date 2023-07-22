;; --------------- Settings ---------------
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default
 compilation-always-kill t         ; kill compilation process before starting another.
 compilation-ask-about-save nil    ; save all buffers on `compile'.
 compilation-scroll-output t
 tab-width 2
 indent-tabs-mode nil              ; set indentation with spaces instead of tabs with 4 spaces.
 require-final-newline t
 backward-delete-char-untabify-method 'hungry
 )

(setq
 make-backup-files nil
 auto-save-default nil
 inhibit-startup-screen t
 scroll-step 1                      ; scroll with less jump.
 scroll-preserve-screen-position t
 scroll-margin 3
 scroll-conservatively 101
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01
 lazy-lock-defer-on-scrolling t     ; set this to make scolloing faster.
 auto-window-vscroll nil            ; Lighten vertical scroll.
 fast-but-imprecise-scrolling nil
 mouse-wheel-scroll-amount '(1 ((shift) . 1))
 mouse-wheel-progressive-speed nil
 hscroll-step 1                     ; Horizontal Scroll.
 hscroll-margin 1
 tab-always-indent 'complete        ; smart tab behavior - indent or complete.
 view-read-only t					; Toggle ON or OFF with M-x view-mode (or use e to exit view-mode).
 use-dialog-box nil                 ; Don't pop up UI dialogs when prompting.
 require-final-newline t            ; require final new line.
 display-line-numbers 'relative
 )

(global-display-line-numbers-mode)
;; Remove clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-pair-mode 1)

;; Zoom in/out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Font
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-11"))
(setq-default line-spacing 0.25)

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(load-theme 'catppuccin t)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(load "packages")

(add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'treemacs-mode-hook (lambda () (setq mode-line-format nil)))
