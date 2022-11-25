(setq-default
 require-final-newline t ;; Auto create a newline at end of file
 custom-safe-themes t    ;; Don't ask if theme is safe
 )

(defalias 'yes-or-no-p 'y-or-n-p) ;; Y or N instead of yes or no

;; Escape with single esc
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

;; UI
(set-frame-font "FiraCode Nerd Font 12" nil t) ; Font
(setq inhibit-splash-screen nil ; I have a nicer one
      inhibit-startup-echo-area-message t ; Make the startup a little cleaner
      inhibit-startup-message t) ; No messages on startup
(setq visible-bell t)            ; Flash when the bell rings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative) ;; Set it to relative, it makes for easier maths

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook
                treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(savehist-mode)
(recentf-mode)

;; Indentation
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq indent-line-function 'insert-tab) ;; Convert tabs to spaces

;; Package manager bootstrap
(declare-function elpaca-generate-autoloads "elpaca")
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(when-let ((elpaca-repo (expand-file-name "repos/elpaca/" elpaca-directory))
           (elpaca-build (expand-file-name "elpaca/" elpaca-builds-directory))
           (elpaca-target (if (file-exists-p elpaca-build) elpaca-build elpaca-repo))
           (elpaca-url  "https://www.github.com/progfolio/elpaca.git")
           ((add-to-list 'load-path elpaca-target))
           ((not (file-exists-p elpaca-repo)))
           (buffer (get-buffer-create "*elpaca-bootstrap*")))
  (condition-case-unless-debug err
      (progn
        (unless (zerop (call-process "git" nil buffer t "clone" elpaca-url elpaca-repo))
          (error "%s" (list (with-current-buffer buffer (buffer-string)))))
        (byte-recompile-directory elpaca-repo 0 'force)
        (require 'elpaca)
        (elpaca-generate-autoloads "elpaca" elpaca-repo)
        (kill-buffer buffer))
    ((error)
     (delete-directory elpaca-directory 'recursive)
     (with-current-buffer buffer
       (goto-char (point-max))
       (insert (format "\n%S" err))
       (display-buffer buffer)))))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :host github :repo "progfolio/elpaca"))

;; Prevent custom from messing with my config file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq create-lockfiles nil) ;; Disable lockfiles

(elpaca use-package (require 'use-package))

(elpaca-use-package (dashboard)
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t
        dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t
        dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")))
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  )

(elpaca-use-package (doom-themes)
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(elpaca-use-package (autothemer)
  :ensure t
  :config
  (load "~/.config/emacs/themes/catppuccin-theme.el")
  (load-theme 'catppuccin-mocha)
  )

(elpaca-use-package (treemacs)
  :config
  (setq treemacs-width 18)
  (treemacs-follow-mode t))

(elpaca-use-package (evil)
  :config
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'dashboard-mode)
  ;; Bring some Emacs to Evil
  (setq evil-cross-lines t
        evil-move-beyond-eol t
        evil-symbol-word-search t
        evil-want-Y-yank-to-eol t
        evil-cross-lines t)
  )
(elpaca treemacs-evil)

(elpaca (general)
  :config
  (general-create-definer nolawz/leader-def
    :prefix "SPC")
  (nolawz/leader-def
    :keymaps 'normal
    "k" 'treemacs)
  )

(elpaca-use-package (which-key)
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(elpaca-use-package (rainbow-delimiters)
  :hook (prog-mode . rainbow-delimiters-mode))

(elpaca all-the-icons)

(elpaca-use-package (telephone-line)
  :config
  (telephone-line-mode 1))

;; Completeion
(elpaca-use-package (vertico)
  :init
  (vertico-mode)
  (setq vertico-count 20)
  (setq vertico-cycle t)
  )

(elpaca-use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))


(elpaca-use-package (company)
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq-default company-backends '(company-files))

  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-require-match 'never
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers nil
        company-tooltip-limit 5
        company-tooltip-margin 3
        company-tooltip-align-annotations t
        company-tooltip-minimum-width 50))

;; IDE
(elpaca-use-package go-mode)

(elpaca-use-package (lsp-mode)
  :init
  :hook ((lua-mode . lsp)
         (python-mode . lsp)
         (sh-mode . lsp)
         (css-mode . lsp)
         (html-mode . lsp)
         (json-mode . lsp)
         (markdown-mode . lsp)
         (latex-mode . lsp)
         (text-mode . lsp)
         (org-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-enable-symbol-highlighting nil
        lsp-ui-doc-enable t
        lsp-lens-enable nil
        lsp-headerline-breadcrumb-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-enable t
        lsp-modeline-code-actions-enable t
        lsp-ui-sideline-enable t
        lsp-ui-doc-border nil
        lsp-eldoc-enable-hover t
        lsp-log-io nil
        lsp-enable-file-watchers nil)
  )

(elpaca-use-package (lsp-ui)
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-show-hover t
        lsp-ui-sideline-delay 0.5
        lsp-ui-doc-delay 5
        lsp-ui-sideline-ignore-duplicates t
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-alignment 'frame
        lsp-ui-doc-header nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-use-childframe t)
  :commands lsp-ui-mode)


(elpaca-use-package (format-all)
  :init (format-all-mode))

;; Programming
(elpaca-use-package (auctex)
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init
  (progn
    (setq TeX-auto-save t
          TeX-parse-self t
          TeX-save-query nil
          TeX-PDF-mode t)))

;; LSP Servers
(setq lsp-tex-server 'digestif)

;; Project.el set determine root directory
(elpaca-use-package ("project.el" :package "project.el")
  :init
  (defgroup project-local nil
  "Local, non-VC-backed project.el root directories."
  :group 'project)

(defcustom project-local-identifier ".project"
  "You can specify a single filename or a list of names."
  :type '(choice (string :tag "Single file")
                 (repeat (string :tag "Filename")))
  :group 'project-local)

(cl-defmethod project-root ((project (head local)))
  "Return root directory of current PROJECT."
  (cdr project))

(defun project-local-try-local (dir)
  "Determine if DIR is a non-VC project.
DIR must include a file with the name determined by the
variable `project-local-identifier' to be considered a project."
  (if-let ((root (if (listp project-local-identifier)
                     (seq-some (lambda (n)
                                 (locate-dominating-file dir n))
                               project-local-identifier)
                   (locate-dominating-file dir project-local-identifier))))
      (cons 'local root)))

(customize-set-variable 'project-find-functions
                        (list #'project-try-vc
                              #'project-local-try-local))
)

(provide 'init.el)
