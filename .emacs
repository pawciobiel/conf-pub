;;-*-coding: utf-8-*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; pgb emacs file :-) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(setenv "PATH" "/home/pgb/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/pgb/.local/bin")

(defvar first-time t "Flag signifying this is the first time that .emacs has been evaled.")

;;(toggle-debug-on-error)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(add-to-list 'load-path "~/conf-pub/lisp/")
;; (add-to-list 'load-path "/usr/local/emacs/share/emacs/29.4/lisp/")
;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   '("bd67dc406ff6f984050b09c0e090e8da46ff355bd3011e158f65f0efdd9744f0" "5463a850f8bb316903f94b7f73409aa353381daf94fbfd3ec0ecbc737b68434c" default))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(js-enabled-frameworks '(javascript))
 '(js-indent-level 4)
 '(mode-require-final-newline nil)
 '(package-archives '(("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(consult-projectile consult-ag orderless consult marginalia vertico highlight-indent-guides dashboard company-go lsp-docker xref go-complete lsp-ui dap-mode lsp-jedi lsp-mode go-mode cider undo-tree all-the-icons web-beautify js2-mode restart-emacs iedit isortify jq-format flycheck-aspell scss-mode magit-filenotify projectile virtualenvwrapper python-black flycheck restclient dired-subtree dired-toggle dired-single gitlab-ci-mode gitlab-ci-mode-flycheck tide typescript-mode w3 python-mode csv-mode toml-mode docker-compose-mode dockerfile-mode jedi-core json-reformat less-css-mode yapfify imenu-list dired tern rainbow-delimiters use-package web-mode elisp-format yaml-mode handlebars-mode jinja2-mode mustache pyimpsort neotree dired-narrow sql-indent ac-ispell sphinx-doc sphinx-mode markdown-mode auto-complete-nxml auto-complete-rst pydoc magit json-mode jedi))
 '(projectile-indexing-method 'hybrid)
 '(require-final-newline nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "brightwhite"))))
 '(error ((t (:foreground "salmon" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "steelblue"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "DimGray"))))
 '(font-lock-comment-face ((t (:foreground "DimGray"))))
 '(font-lock-constant-face ((t (:foreground "darkcyan"))))
 '(font-lock-doc-face ((t (:foreground "green4"))))
 '(font-lock-function-name-face ((t (:foreground "#add8e6"))))
 '(font-lock-keyword-face ((t (:foreground "mediumpurple"))))
 '(font-lock-string-face ((t (:foreground "green4"))))
 '(font-lock-variable-name-face ((t (:foreground "white" :weight light))))
 '(highlight-indent-guides-character-face ((t (:foreground "color-236"))))
 '(lsp-ui-doc-background ((t (:background "black"))))
 '(neo-dir-link-face ((t (:foreground "deep sky blue" :slant normal :weight bold :height 120 :family "Fantasque Sans Mono"))))
 '(neo-file-link-face ((t (:foreground "White" :weight normal :height 120 :family "Fantasque Sans Mono"))))
 '(success ((t (:foreground "Green4" :weight bold)))))


(require 'package)
(package-initialize)
;;(unless package-archive-contents (package-refresh-contents))
;;(package-install-selected-packages)


;; js autocompletion
;; http://ternjs.net/doc/manual.html#emacs
;; THIS IS not NEEDED as installed via package???
;;(add-to-list 'load-path "~/.emacs.d/tern/")
(add-to-list 'load-path "~/node_modules/tern/emacs/")
;;(autoload 'tern-mode "tern.el" nil t)
;; js autocomplete via tern + ac - czy to w ogóle działa?
;;(eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

(setq shell-file-name "/usr/bin/bash")

;;(load-file "~/.emacs.d/lisp/pdb-current.el")
(load-file "~/.emacs.d/lisp/tophead-line-buffer-name.el")

(setq use-short-answers 1
      create-lockfiles nil
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
;;(setq auto-save-file-name-transforms
;;                `((".*" ,temporary-file-directory t)))

;; zamiast recentf-mode mam desktop-save-mode
;;(if first-time
;;(progn
;;(desktop-read)))

(setq-default my-own-path "/home/pgb/.emacs.d")
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-auto-save-timeout 2
      desktop-dirname "~/.emacs.d/"
      desktop-base-file-name ".emacs.desktop"
      desktop-save nil
      desktop-load-locked-desktop nil)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Witaj ponownie Pawciu!")
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 5)
                        (registers . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  )

;;(if (file-exists-p
;;     (concat my-own-path ".emacs.desktop"))
;;    (desktop-read my-own-path))

(add-hook 'kill-emacs-hook `(lambda ()
			                  (desktop-save my-own-path t)))

;; start server if it's not already running
                                        ;(if first-time
                                        ;(load "server")
                                        ;(unless (server-running-p) (server-start)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my defuns

(defun my-kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun kill-other-buffers() 
  "Kill all other buffers." 
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)
			   (buffer-list))))

(defun my-kill-current-buffer() 
  "Kill current buffer." 
  (interactive)
  (kill-buffer (current-buffer)))

(defun duplicate-line() 
  "Duplicate line." 
  (interactive)
  ;;(back-to-indentation)
  (move-beginning-of-line 1)
  (move-beginning-of-line 1)  ;; 2x dziala lepiej z lsp-mode(?)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank)
  (move-beginning-of-line 1)
  )

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name) 
  "Renames both current buffer and file it's visiting to NEW-NAME." 
  (interactive "New name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn (rename-file filename new-name 1)
	       (rename-buffer new-name)
	       (set-visited-file-name new-name)
	       (set-buffer-modified-p nil))))))

(defun run-ipython() 
  "Run ipython." 
  (interactive)
  (term "/home/pgb/bin/ipython3"))


(defun my-next-user-buffer () 
  "Switch to the next user buffer (buffer name does not start with “*”)." 
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-equal "*" (substring (buffer-name) 0 1))
		(< i 20))
      (setq i (1+ i))
      (next-buffer))))

(defun my-prev-user-buffer () 
  "Switch to the previous user buffer (buffer name does not start with “*”)." 
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-equal "*" (substring (buffer-name) 0 1))
		(< i 20))
      (setq i (1+ i))
      (previous-buffer))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load-file "~/.emacs.d/lisp/fill-column-indicator.el")
;;(require 'fill-column-indicator)
;;(define-globalized-minor-mode global-fci-mode fci-mode
;;  (lambda ()
;;    (fci-mode 1)))
;;(global-fci-mode 1)
;;(setq fci-rule-width 1
;;      fci-rule-column 79
;;      fci-rule-color "darkblue")
(set-default 'truncate-lines t)
;; visual-line-mode
(global-set-key "\C-c$" 'toggle-truncate-lines)
;;(add-hook 'diff-mode-hook (lambda () (setq truncate-lines t)))

(setq-default ediff-split-window-function 'split-window-horizontally)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;;(global-linum-mode 0) ;; poszczegolne mody włączają linum

(global-prettify-symbols-mode 0)

(setq-default linum-format "%4d \u2502 ")
(when (display-graphic-p)
  (setq-default linum-format "%d "))

(setq column-number-mode    t
      scroll-step           1 scroll-conservatively  10000)
(which-function-mode 1)


(defun rst-custom()
  (visual-line-mode +1)
  )
;;(add-hook 'rst-mode-hook 'rst-custom)
(add-hook 'view-mode-hook 'rst-custom)


(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
;; when searching place highlited text in the middle of the screen - recenter
;;(add-hook 'isearch-mode-end-hook 'recenter-top-bottom)
;;(defadvice
;;  isearch-repeat-forward
;;  (after isearch-repeat-forward-recenter activate)
;;  (recenter-top-bottom))
;;(ad-activate 'isearch-repeat-forward)

;;(defadvice
;;  isearch-repeat-backward
;;  (after isearch-repeat-backward-recenter activate)
;;  (recenter-top-bottom))
;;(ad-activate 'isearch-repeat-backward)

;;(require 'dired)
;;(setq dired-use-ls-dired nil)
;;(use-package dired-single
;;  :ensure t
;;  :after dired
;;  )
;;
;;(require 'dired+)
;;(setq diredp-bind-problematic-terminal-keys nil)
                                        ;(defun dired-custom()
                                        ;  "konfig dired-mode"
                                        ;  (diredp-toggle-find-file-reuse-dir t)
                                        ;  (local-set-key (kbd "M-O") nil))
                                        ;(add-hook 'dired-mode-hook 'dired-custom)
                                        ;(eval-after-load 'dired-mode '(define-key dired-mode-map (kbd "M-O") nil))

;;(put 'dired-find-alternate-file 'disabled nil)
;;(defadvice dired-advertised-find-file (around dired-subst-directory activate)
;;  "Replace current buffer if file is a directory."
;;  (interactive)
;;  (let ((orig (current-buffer))
;;        (filename (dired-get-filename))) ad-do-it (when (and (file-directory-p filename)
;;                                                             (not (eq (current-buffer) orig)))
;;                                                    (kill-buffer orig))))
;;
;;(eval-after-load "dired"
;;  ;; don't remove `other-window', the caller expects it to be there
;;  '(defun dired-up-directory
;;       (&optional
;;        other-window)
;;     "Run Dired on parent directory of current directory."
;;     (interactive "P")
;;     (let* ((dir (dired-current-directory))
;;            (orig (current-buffer))
;;            (up (file-name-directory (directory-file-name dir))))
;;       (or (dired-goto-file (directory-file-name dir))
;;     	   ;; Only try dired-goto-subdir if buffer has more than one dir.
;;     	   (and (cdr dired-subdir-alist)
;;                (dired-goto-subdir up))
;;           (progn (kill-buffer orig)
;;                  (dired up)
;;                  (dired-goto-file dir))))))
;;;;;;;;;
;; otwiera w tym samym bufforze, problem w tym ze pliki powinien otwierac w nowym
;; a tylko katalogi w tym samym
;; wiecel lepiej jest uzywac `a` by otwieral wtym samym bufferze a nie RET!
;;(defun dired-custom()
;;  "konfig dired-mode"
;;  (local-set-key (kbd "RET") 'dired-find-alternate-file)) ;; otwiera w tym samym bufferze
;;(add-hook 'dired-mode-hook 'dired-custom)
;;(setq dired-use-ls-dired nil)

;;(use-package dired-subtree :ensure t
;;  :after dired
;;  :config
;;  (bind-key "<tab>" 'dired-subtree-toggle dired-mode-map)
;;  (bind-key "<backtab>" 'dired0subtree-cycle dired-mode-map))


;; I create a group call Dired, which contains all buffer in dired-mode
;;(setq-default ibuffer-saved-filter-groups `(("Default"
;;("Dired" (mode . dired-mode))
;;("Dired" (mode . "\*Dired\*"))
;;("Temporary" (name . "\*.*\*")))))


(use-package projectile
  :defer nil
  :ensure t
  :bind (
         ("C-x C-p" . projectile-find-file)
         )
  :config (progn
            (projectile-mode +1)
            (setq projectile-enable-caching t
                  projectile-files-cache-expire 432000
                  projectile-globally-ignored-file-suffixes (quote (".pyc")))
            ;;(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)                                                                                        
            )
  )


(use-package vertico
  :ensure t
  ;;:bind (
         ;; TODO fix up vertico-directory-up to go to parent dir when wrong file is on the end in `find-file`                                                         
         ;;:map vertico-map                                                                                                                                           
         ;;     ("C-<backspace>" . vertico-directory-up)                                                                                                              
              ;;("C-j" . vertico-next)                                                                                                                                
              ;;("C-k" . vertico-previous)                                                                                                                            
              ;;("C-f" . vertico-exit)                                                                                                                                
         ;;:map minibuffer-local-map                                                                                                                                  
         ;;     ("C-<backspace>" . vertico-directory-up)                                                                                                              
         ;;     ("M-<backspace>" . backward-kill-word)                                                                                                                
  ;;)
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package consult
  :ensure t
  :bind (("C-x p" . consult-projectile-switch-project)
         ("C-x s" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-g g" . consult-goto-line)
         )
  )

(use-package consult-projectile
  :ensure t
  :after consult
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))


(use-package undo-tree
  :defer t
  :hook ((prog-mode text-mode conf-mode) . undo-tree-mode)
  :config
  (progn
    (global-undo-tree-mode +1)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/backups/undo-tree")))
    ;;(define-key undo-tree-mode-map (kbd "C-x u") 'undo-tree-undo)  ;; C-x u is default undo
    ;;(local-set-key (kbd "C-x u") 'undo-tree-undo)  ;; undo-tree-visualize
    ;;(local-unset-key (kbd "C-/"))
    ;;(local-unset-key (kbd "C-_"))
    ;;(local-unset-key (kbd "C-c /"))
    ;;(local-unset-key (kbd "C-c _"))
    )
  )


;; auto-complete-mode ac-mode ac AC auto-complete.el
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu t
      ac-show-menu-immediately-on-auto-complete t
      ac-auto-start nil) ;; I'll use trigger key albo kbd mapping C-/
;;(setq ac-expand-on-auto-complete t)
;;(setq ac-use-comphist nil)  FOR PERFORMANCE
;; (setq ac-auto-show-menu 0.8)
;;(ac-set-trigger-key "TAB")
(define-key ac-complete-mode-map "\t" 'ac-expand)
;;(define-key ac-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map "\r" 'ac-complete)
;;(define-key ac-mode-map "\r" 'ac-complete)
;;(setq ac-use-quick-help t)
;;(setq ac-quick-help-delay 1)
;; ac-help  C-?
;; ac-complete
;; ac-expand
;; ac-stop complete C-g
;;(define-key ac-completing-map "\M-/" 'ac-stop)
;; DEFAULT (define-key map (kbd "M-TAB") 'auto-complete)
(define-key ac-mode-map (kbd "C-/") 'auto-complete)
(define-key ac-mode-map (kbd "C-_") 'auto-complete)
(define-key ac-mode-map (kbd "C-c /") 'auto-complete)
(define-key ac-mode-map (kbd "C-c _") 'auto-complete)
(global-set-key (kbd "C-/") 'auto-complete)
(global-set-key (kbd "C-_") 'auto-complete)
(global-set-key (kbd "C-c /") 'auto-complete)
(global-set-key (kbd "C-c _") 'auto-complete)


(global-set-key (kbd "C-x <right>") 'my-next-user-buffer)
(global-set-key (kbd "C-x <left>") 'my-prev-user-buffer)


(use-package auto-complete-nxml
  :defer t
  :config (setq auto-complete-nxml-automatic-p nil))

(use-package jinja2-mode
  :defer t
  )

(use-package markdown-mode
  :defer t
  )

(use-package yaml-mode
  :defer t
  )

(use-package python-black
  :defer t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim)
  :config (setq python-black-command "/home/pgb/bin/black"))

(use-package web-mode
  :defer t
  :hook (web-mode)
  :config (setq web-mode-markup-indent-offset 2
        web-mode-enable-current-element-highlight 1)
  )

(use-package magit
  :defer t
  :bind (
         ;;:map magit-mode-map
         ("C-x g" . magit-status) ;; Display the main magit popup
		 ("C-x M-g" . magit-dispatch) ;; Display keybinds for magit
         )
  )

;; jedi:start-dedicated-server
(use-package jedi
  :defer t
  :ensure t
  :after python
  :hook (python-mode . jedi:setup)
  :config
  ;; this calls jedi:ac-setup and sets ac-sources
  ;;(add-to-list 'ac-sources 'ac-source-jedi-direct)

  (setq jedi:tooltip-method '(pos-tip popup)
        jedi:get-in-function-call-timeout 11000
        jedi:get-in-function-call-delay 10000) ;; wait long for tooltip-popup - chyba tego nie lubie... i wole `C-c f` jedi:get-in-function-cal
  ;;
  ;; ta wersja z githuba cos nie dziala wiec jest symlink do
  ;; .emacs.d/elpa/jedi-core-20210503.1315/jediepcserver.py
  (setq jedi:server-command '("python3" "-W" "ignore::DeprecationWarning" "/home/pgb/.emacs.d/.python-environments/default/bin/jediepcserver.py"))
  ;;(jedi:tooltip-method nil)
  ;;(setq jedi:environment-root "/home/pgb/.local")
  ;;(setq jedi:environment-virtualenv
  ;;	(append python-environment-virtualenv
  ;;		'("--python" "/usr/bin/python3 -W ignore::DeprecationWarning")))
  ;;
  ;; to nie działa jak jest nowsza wersja jedi.py niz jedi.el!?!?!?!?
  ;;(setq jedi:server-args
  ;;      '("--sys-path-append" "/home/pgb/.local/lib/python3.11/site-packages"))
  ;;
  ;; "--virtual-env" "SOME/VIRTUAL_ENV_1"
  ;; "--sys-path" "MY/OTHER/SPECIAL/PATH"))

  ;;(setq-default jedi:setup-keys t)
  ;;(setq python-environment-directory "/home/pgb/.local")
  ;;python-environment-default-root-name
  (setq jedi:complete-on-dot nil))

;;(use-package lsp-jedi
;;  :ensure t
;;  :config
;;  (with-eval-after-load "lsp-mode"
;;    (add-to-list 'lsp-disabled-clients 'pyls)
;;    (add-to-list 'lsp-enabled-clients 'jedi)))

;; move windows with shift+arrow
(windmove-default-keybindings 'shift)

(put 'upcase-region 'disabled nil)

(show-paren-mode t)
(setq visible-bell nil)

(load-file "~/.emacs.d/lisp/move-lines.el")
(require 'move-lines)
(add-hook 'prog-mode #'move-lines 100)
(add-hook 'text-mode #'move-lines 100)
(add-hook 'conf-mode #'move-lines 100)
(move-lines-binding)

;; hs-minor-mode
;;(load-library "hideshow")
(require 'hideshow)
(global-set-key (kbd "C-c -") 'hs-hide-block)
(global-set-key (kbd "C-c =") 'hs-show-block)
;;; hideshowvis.el
;;(load-file "~/.emacs.d/lisp/hideshowvis.el")
(require 'hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe." 'interactive)
(hideshowvis-symbols)


(use-package highlight-indent-guides
  :defer t
  :after python
  :config
  ;;(setq highlight-indent-guides-method 'bitmap)                                                                                                                     
  (setq highlight-indent-guides-method 'character)
  (set-face-foreground 'highlight-indent-guides-character-face "color-236")
  (highlight-indent-guides-mode +1)
  :hook python-mode
)

(require 'neotree)
(setq neo-smart-open t
      neo-theme (if (display-graphic-p) 'icons 'arrow)
      neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" "__pycache__")
      )
;;(setq projectile-switch-project-action 'neotree-projectile-action)
(defun neotree-project-dir () 
  "Open NeoTree using the git root." 
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir (if (neo-global--window-exists-p)
			(progn (neotree-dir project-dir)
			       (neotree-find file-name)))
      (message "Could not find git project root."))))

(use-package flycheck
  :defer t
  :ensure t
  :config
  (flymake-mode -1)
  (global-flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(mode-enabled save)
        flycheck-checker-error-threshold 600))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda ()
		           (hideshowvis-enable)
		           (electric-indent-mode nil)
                   ;;(linum-mode)
                   (flyspell-mode +1))))

(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda ()
		           (flyspell-mode -1))))

;; ispell/aspel
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list") ;; aspel uzywa --list
;; ispell-valid-dictionary-list
(setenv "DICTIONARY" "en_GB")
;; (setenv "DICTIONARY" "en-GB")
;; (setenv "DICTIONARY" "pl")
;; speed it up at the cost of reducing the quality of its suggestions
(setq ispell-extra-args '("--sug-mode=fast"))
(eval-after-load "auto-complete" '(progn (ac-ispell-setup)))


(defun fd-switch-dictionary() 
  "Switch language dictionary." 
  (interactive)
  (let* ((dic ispell-current-dictionary)
	 (change (if (string= dic "en_GB") "pl" "en_GB")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prog modes


(defun python-custom() 
  "My custom python-mode-hook."
  (require 'pyimpsort)
  (require 'dap-python)
  ;;(dap-register-debug-template "My App"
  ;;  (list :type "python"
  ;;        :args "-i"
  ;;        :cwd nil
  ;;        :env '(("DEBUG" . "1"))
  ;;        :target-module (expand-file-name "~/src/myapp/.env/bin/myapp")
  ;;        :request "launch"
  ;;        :name "My App"))

  (hideshowvis-enable) 
  (flyspell-prog-mode) 
  (flycheck-mode +1)
  ;;(add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
  (setq-default flycheck-disabled-checkers '(python-mypy python-flake8 python-pylint javascript-jshint))
  ;;(setq flycheck-python-flake8-executable "/home/pgb/.local/bin/flake8")
  ;;(setq flycheck-python-pylint-executable "/home/pgb/.local/bin/pylint")
  ;;(setq flycheck-python-mypy-executable "/home/pgb/.local/bin/mypy")
  (setq flycheck-python-ruff-executable "/home/pgb/.local/bin/ruff"
        flycheck-checker 'python-ruff
        flycheck-python-pyright-executable "/home/pgb/.local/bin/pyright"
        flycheck-pylintrc "/home/pgb/.pylintrc")
  (flycheck-add-next-checker 'python-ruff 'python-pyright)

  ;;(setq prettify-symbols-alist nil)
  ;;(push '("<=" . ?≤) prettify-symbols-alist)
  (setq prettify-symbols-alist '(
                                 ("<=" . ?≤)
                                 (">=" . ?≥)
                                 ("!=" . ?≠)
                                 ("lambda" . ?λ)
                                 ))
  (prettify-symbols-mode +1)

  (python-black-on-save-mode +1)


  ;; 1) virtualenvwrapper
  (require 'virtualenvwrapper)
  (setq venv-dirlookup-names '())
  (setq venv-location "/home/pgb/.virtualenvs/")
  ;;  (setq projectile-switch-project-action 'venv-projectile-auto-workon)
  ;;  (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
  ;;  (setq-default mode-line-format (remove 'mode-line-buffer-identification mode-line-format))
  (add-hook 'venv-postactivate-hook 'jedi:stop-server)
  (add-hook 'venv-postdeactivate-hook 'jedi:stop-server)

  ;; M-/ = dabbrev-expand
  ;; C-/ = auto-complete (ac-mode-map)
  ;; C-c / = C-c / runs the command helm-jedi-related-names (jedi-mode-map)
  (local-unset-key (kbd "C-_"))
  (local-unset-key (kbd "C-/"))  ;; clash with undo-tree
  (local-unset-key (kbd "C-c _"))
  (local-unset-key (kbd "C-c /"))
  (local-set-key (kbd "C-_") 'ac-complete)
  (local-set-key (kbd "C-c _") 'jedi:complete)
  (local-set-key (kbd "C-/") 'ac-complete)
  (local-set-key (kbd "C-c /") 'jedi:complete)

  ;;(local-set-key (kbd "C-.") 'helm-ispell)
  (local-set-key (kbd "C-c .") 'jedi:goto-definition)
  (local-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "C-h d") 'jedi:show-doc)  ;; default jedi's is C-?
  (local-set-key (kbd "C-h f") 'jedi:get-in-function-call)
  (global-set-key (kbd "<f12>") 'my-insert-pdb)
  (defun my-insert-pdb ()
    (interactive)
    (insert
     "import pdb; pdb.Pdb(skip=['tornado.*', '_pytest.*', 'pluggy.*', 'asyncio.*', 'abc', 'ast']).set_trace()"))

  ;; (setq indent-tabs-mode f)
  (setq-default tab-width 4)
  (setq tab-width 4)
)
(add-hook 'python-mode-hook 'python-custom 100)
(eval-after-load 'python '(define-key python-mode-map (kbd "C-c C-i") #'pyimpsort-buffer))


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(defun js-custom () 
  "My custom js-mode-hook."
  (hideshowvis-enable)
  (flyspell-prog-mode)
  (setq flycheck-disabled-checkers '(javascript-jshint))
  (setq flycheck-checkers '(javascript-eslint))
  (setq flycheck-javascript-eslint-executable "/home/pgb/.local/bin/eslint")
  (setq web-beautify-js-program "~/bin/js-beautify.js")
  (setq js-indent-level 4)
  (setq-default js2-basic-offset 4)
  (setq-default indent-tabs-mode nil)
  (setq mode-require-final-newline nil)
  (local-unset-key (kbd "C-_"))
  (local-unset-key (kbd "C-c _"))
  (local-unset-key (kbd "C-c ."))
  (local-unset-key (kbd "C-c ,"))
  (local-set-key (kbd "C-c /") 'tern-completion-at-point)
  (local-set-key (kbd "C-c _") 'tern-completion-at-point)
  (local-set-key (kbd "C-/") 'tern-completion-at-point)
  (local-set-key (kbd "C-_") 'tern-completion-at-point)
  ;;(local-set-key (kbd "C-.") 'helm-ispell)
  (local-set-key (kbd "C-c .") 'tern-find-definition)
  (local-set-key (kbd "C-,") 'tern-pop-find-definition)
  (local-set-key (kbd "C-c ,") 'tern-pop-find-definition)
  (prettify-symbols-mode +1)
  (push '("function" . ?ƒ) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("!=" . ?≠) prettify-symbols-alist)
  (tern-mode t))
(add-hook 'js-mode-hook 'js-custom)


(require 'lsp-mode)
(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))
;; nie chce complte-at-point tylko complete via gopls mode
;;;(add-hook 'completion-at-point-functions 'go-complete-at-point)
(add-hook 'go-mode-hook #'lsp-deferred)
;;(add-hook 'python-mode-hook #'lsp-deferred)

(defun go-custom() 
  "My custom golang go-mode."

  (require 'dap-dlv-go)
  
  (local-set-key (kbd "C-/") 'auto-complete)
  (local-set-key (kbd "C-_") 'auto-complete)
  (local-set-key (kbd "C-c /") 'auto-complete)
  (local-set-key (kbd "C-c _") 'auto-complete)
  
  (local-set-key (kbd "C-c .") 'xref-find-definitions)
  (local-set-key (kbd "C-c ,") 'xref-pop-marker-stack)
  
;;  (lsp-deferred)
;;  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
)
(add-hook 'go-mode-hook 'go-custom)


(defun php-custom() 
  "My custom php-mode."
  (local-set-key (kbd "C-d") nil)
  (local-set-key (kbd "C-/") 'auto-complete)
  (local-set-key (kbd "C-_") 'auto-complete)
  (local-set-key (kbd "C-c /") 'auto-complete)
  (local-set-key (kbd "C-c _") 'auto-complete)
)
(add-hook 'php-mode-hook 'php-custom)

(defun clojure-custom() 
  "My custom clojure-mode cider-mode"
  (local-set-key (kbd "C-/") 'auto-complete)
  (local-set-key (kbd "C-c /") 'auto-complete)
)
(add-hook 'clojure-mode-hook 'clojure-custom)


(defun markdown-custom() 
  "My custom markdown-mode."
  (local-set-key (kbd "C-d") nil)
  (setq indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq visual-line-mode t))
(add-hook 'markdown-mode-hook 'markdown-custom)


(defun restclient-custom() 
  "My custom restclient-mode."
  (fset 'json-pretty-print 'json-reformat-region))
(add-hook 'restclient-mode-hook 'restclient-custom)


(defun elisp-custom() 
  "My custom elisp-mode."
  (prettify-symbols-mode +1)
  (push '("lambda" . ?λ) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("!=" . ?≠) prettify-symbols-alist)
  (hideshowvis-enable)
  (rainbow-delimiters-mode)
  (local-set-key (kbd "C-d") nil))
(add-hook 'emacs-lisp-mode-hook 'elisp-custom)

(add-hook 'prog-mode-hook
          (lambda ()
			(hideshowvis-enable)
			(hs-minor-mode)
			(flycheck-mode +1)
            ;;(linum-mode)
            (flyspell-prog-mode)))

(defun setup-tide-mode () 
  "My custom tide-mode for typescript." 
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (electric-indent-mode nil)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq tab-width 2)
  (setq typescript-indent-level (or (plist-get (tide-tsfmt-options)
					       ':indentSize) 
				    2))
  (local-unset-key (kbd "C-c ."))
  (local-unset-key (kbd "C-c ,"))
  (local-set-key (kbd "C-c .") 'tide-jump-to-definition)
  (local-set-key (kbd "C-c ,") 'tide-jump-back)

  ;;  "indentSize": 2,
  ;;  "tabSize": 2,
  ;;  "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
  ;;  "placeOpenBraceOnNewLineForFunctions": false,
  ;;  "placeOpenBraceOnNewLineForControlBlocks": false
  (setq tide-format-options 
	'(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
								:indentSize 2
								:tabSize 2
								:placeOpenBraceOnNewLineForControlBlocks
								nil
								:placeOpenBraceOnNewLineForFunctions
								nil))

  ;; formats the buffer before saving
  ;;(add-hook 'before-save-hook 'tide-format-before-save)
  )
(add-hook 'typescript-mode-hook #'setup-tide-mode)

                                        ;(size-indication-mode 1)
;;; large file - duzy pliczek, powyłączaj co się da...
                                        ;(add-hook 'find-file-hook #'fuck-large-file)
                                        ;(defun fuck-large-file ()
                                        ;  (when (> 100000 (buffer-size))
                                        ;    (linum-mode -1)
                                        ;    (jedi-mode -1)
                                        ;    (fci-mode -1)
                                        ;    (font-lock-mode -1)
                                        ;    )
                                        ;)


;;; Show Diff Highlighting with Margin
;;; diff-hl does not work in the terminal by default.
;;; It turns out that diff-hl already has a solution by using “margin” to show the diff.
;;; Turn on diff-hl-margin-mode whenever inside a terminal:
(add-hook 'diff-hl-mode-on-hook
          (lambda ()
            (unless (display-graphic-p)
              (diff-hl-margin-local-mode))))

;;; open url in local browser as opposed to ssh term browser
;;;(defun my/browse-url-advice (orig-fun &rest args)
;;;  "In terminal, copy the url to the kill ring for `browse-url'."
;;;  (if (display-graphic-p)
;;;      (apply orig-fun args)
;;;    (let ((url (car args)))
;;;      (message "Copied link: %s" url)
;;;      (kill-new url))))

(advice-add 'browse-url :around #'my/browse-url-advice)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keys

;; C-x C-b -> ibuffer-list-buffers zamiast helm-buffers
(defalias 'list-buffers 'ibuffer)
(add-hook 'ibuffer-mode-hook
          (lambda ()
			(ibuffer-auto-mode 1)))

(global-set-key (kbd "<f6>")   'flyspell-mode)
(global-set-key (kbd "<f7>")   'fd-switch-dictionary)
(global-set-key (kbd "<f8>") 'neotree-toggle)
;;(global-set-key (kbd "<f8>") 'neotree-project-dir)

(require 'imenu-list)
;; or helm-semantic-or-imenu
(global-set-key (kbd "<f9>") 'imenu-list-smart-toggle)

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<select>") 'end-of-line)

;;(global-unset-key key)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-e") 'kill-whole-line)

(global-set-key (kbd "C-x k") 'my-kill-current-buffer)
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

(global-set-key (kbd "C-c i") 'iedit-mode) ;; iedit rename var occurences


;; M-u  upcase-word
;; M-l  downcase-word
;; C-x C-u  upcase-region
;; C-x C-l  downcase-region

;; zamiast key-binda jest ibuffer modede hook
;;(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
;; to nie działa bo ESC jest jako meta
;;(define-key helm-map (kbd "ESC") 'helm-keyboard-quit)

;;(global-set-key (kbd "C-.") 'helm-ispell)
(global-set-key (kbd "C-c .") 'xref-find-definitions)

(global-set-key (kbd "C-<tab>") nil)

(require 'my-move-word)
(global-set-key (kbd "C-<left>") 'my-backward-word)
(global-set-key (kbd "C-<right>") 'my-forward-word)

;;(global-unset-key (kbd "C--"))
;;(global-unset-key (kbd "C-="))

;; change indent-rigidly
(global-unset-key (kbd "C-x C-i"))
(global-unset-key (kbd "C-x TAB"))
(global-set-key (kbd "C-c C-i") 'indent-rigidly)
(global-set-key (kbd "C-c TAB") 'indent-rigidly)


(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'after-init-hook
          (lambda ()
			(desktop-read)
            ))

(defun my-setup-client-frame()
  "Setup emacsclient frame."
  (if (display-graphic-p)
      (progn
        ;; running in X                                                                                                                                               
        (setq neo-theme 'icons)
        (add-to-list 'default-frame-alist '(foreground-color . "white"))
        (add-to-list 'default-frame-alist '(background-color . "black"))
        (add-to-list 'default-frame-alist '(cursor-color . "coral"))
        ;;(load-theme 'pawcio t)                                                                                                                                      
        (load-theme 'deeper-blue t)
        ;;(require 'color-theme)                                                                                                                                      
        ;;(color-theme-print)                                                                                                                                         
        )
    (progn
      ;; running in console
      (disable-theme 'deeper-blue)
      (load-file "~/.emacs.d/lisp/tophead-line-buffer-name.el")
      )
    )
  )
(add-hook 'server-after-make-frame-hook 'my-setup-client-frame)


(message "Hej ho, all done, %s%s" (user-login-name) ".")
;;; .emacs ends here
(put 'narrow-to-region 'disabled nil)
