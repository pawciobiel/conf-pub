;;;-*-coding: utf-8-*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; pgb emacs file :-) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar first-time t
  "Flag signifying this is the first time that .emacs has been evaled")

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
 '(custom-enabled-themes nil)
 '(helm-boring-buffer-regexp-list
   '("\\Minibuf.+\\*" "\\` " "\\*.+\\*" "^TAGS$" "\\*magit*" "\\*helm*"))
 '(helm-boring-file-regexp-list
   '("\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/?$" "\\.hg/?$" "\\.git/?$" "\\.bzr/?$" "CVS/?$" "_darcs/?$" "_MTN/?$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "^TAGS$"))
 '(js-enabled-frameworks '(javascript))
 '(js-indent-level 2)
 '(mode-require-final-newline nil)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(projectile virtualenvwrapper helm lua-mode python-black flycheck restclient dired-subtree dired-toggle dired-single gitlab-ci-mode gitlab-ci-mode-flycheck tide ng2-mode typescript-mode w3 python-mode racer rust-mode csv-mode toml-mode docker-compose-mode dockerfile-mode helm-ag fish-mode jedi-core json-reformat less-css-mode yapfify imenu-list dired tern rainbow-delimiters use-package web-mode elisp-format yaml-mode handlebars-mode jinja2-mode mustache pyimpsort go-autocomplete neotree dired-narrow ac-php sql-indent ac-ispell sphinx-doc sphinx-mode markdown-mode auto-complete-nxml auto-complete-rst pydoc magit json-mode jedi ido-vertical-mode helm-projectile helm-ispell epic))
 '(require-final-newline nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "DimGray"))))
 '(font-lock-comment-face ((t (:foreground "DimGray"))))
 '(font-lock-doc-face ((t (:foreground "green"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((t (:foreground "white" :weight light))))
 '(neo-dir-link-face ((t (:foreground "deep sky blue" :slant normal :weight bold :height 120 :family "Fantasque Sans Mono"))))
 '(neo-file-link-face ((t (:foreground "White" :weight normal :height 120 :family "Fantasque Sans Mono")))))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; js autocompletion
;; http://ternjs.net/doc/manual.html#emacs
;; THIS IS not NEEDED as installed via package???
;;(add-to-list 'load-path "~/.emacs.d/tern/")
;;(add-to-list 'load-path "~/node_modules/tern/emacs/")
;;(autoload 'tern-mode "tern.el" nil t)
;; js autocomplete via tern + ac - czy to w ogóle działa?
;;(eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

;;(load-file "~/.emacs.d/lisp/pdb-current.el")
(load-file "~/.emacs.d/lisp/tophead-line-buffer-name.el")

;; hideshowvis nie działa bo emacs compiled bez png/gtk...?
;;(load-file "~/.emacs.d/lisp/hideshowvis.el")

;; zamiast recentf-mode mam desktop save
(desktop-save-mode 1)
;(if first-time
;    (progn
;      (desktop-read)))
;; ??? how does this work??(desktop-auto-save-timeout 10)
;;(recentf-mode 1)
;;(setq-default recent-save-file "~/.emacs.d/recentf")

;; start server if it's not already running
;(if first-time
;(load "server")
;(unless (server-running-p) (server-start)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my defuns

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
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

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
  (term "/home/pgb/bin/ipython"))


(defun my-next-user-buffer ()
  "Switch to the next user buffer (buffer name does not start with “*”)."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-equal "*" (substring (buffer-name) 0 1)) (< i 20))
      (setq i (1+ i)) (next-buffer))))

(defun my-prev-user-buffer ()
  "Switch to the previous user buffer (buffer name does not start with “*”)."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-equal "*" (substring (buffer-name) 0 1)) (< i 20))
      (setq i (1+ i)) (previous-buffer))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load-file "~/.emacs.d/lisp/fill-column-indicator.el")
;;(require 'fill-column-indicator)
;;(define-globalized-minor-mode global-fci-mode fci-mode
;;  (lambda ()
;;    (fci-mode 1)))
;;(global-fci-mode 1)
;;(setq fci-rule-width 1)
;;(setq fci-rule-column 79)
;;(setq fci-rule-color "darkblue")
(set-default 'truncate-lines t)
; visual-line-mode
(global-set-key "\C-c$" 'toggle-truncate-lines)
;(add-hook 'diff-mode-hook (lambda () (setq truncate-lines t)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-linum-mode 0) ;; poszczegolne mody włączają linum
;;(setq linum-format "%d ")
(setq linum-format "%4d \u2502 ")

;; if we run xemacs load some related modes and thames
(when (eq window-system 'x)
  ;;(color-theme-robin-hood)
  (load-theme 'manoj-dark t)
  ;;(load-theme 'solarized-dark t)
  (setq linum-format "%d"))
(cond
 ((featurep
   'xemacs)
  ;; Code for XEmacs
  ;;(color-theme-robin-hood))
  )
 (t
  ;; Code for Emacs
  ))

(setq column-number-mode t)
(setq scroll-step            1 scroll-conservatively  10000)
(which-function-mode 1)

;; when searching place highlited text in the middle of the screen - recenter
;;(add-hook 'isearch-mode-end-hook 'recenter-top-bottom)
;;(defadvice
;;  isearch-repeat-forward
;;  (after isearch-repeat-forward-recenter activate)
;;  (recenter-top-bottom))
;;
;;(defadvice
;;  isearch-repeat-backward
;;  (after isearch-repeat-backward-recenter activate)
;;  (recenter-top-bottom))
;;
;;(ad-activate 'isearch-repeat-forward)
;;(ad-activate 'isearch-repeat-backward)

;(require 'dired)
;(setq dired-use-ls-dired nil)
;;(require 'dired-single)
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

;(use-package dired-subtree :ensure t
;  :after dired
;  :config
;  (bind-key "<tab>" 'dired-subtree-toggle dired-mode-map)
;  (bind-key "<backtab>" 'dired0subtree-cycle dired-mode-map))


;;(setq-default ibuffer-saved-filter-groups `(("Default"
;;                                             ;; I create a group call Dired, which contains all buffer in dired-mode
;;                                             ("Dired" (mode . dired-mode))
;;                                             ("Dired" (mode . "\*Dired\*"))
;;                                             ("Temporary" (name . "\*.*\*")))))

(require 'package)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages)

(require 'projectile)
(projectile-global-mode)

;(require 'helm-config)
(require 'helm)

;; to mi duplikuje zmiane buffora a wole miec chyba helm-buffer
;;(require 'popwin)
;;(popwin-mode 1)
;;(setq display-buffer-function 'popwin:display-buffer)
;;(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
;;(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)

(require 'helm-projectile)
(helm-projectile-on)

; auto-complete-mode ac-mode ac AC auto-complete.el
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-show-menu-immediately-on-auto-complete t)
;;(setq ac-expand-on-auto-complete t)
;;(setq ac-use-comphist nil)  FOR PERFORMANCE
;; (setq ac-auto-show-menu 0.8)
(setq ac-auto-start nil) ;; I'll use trigger key
(ac-set-trigger-key "TAB")
;;(setq ac-use-quick-help t)
;;(setq ac-quick-help-delay 1)
;; ac-help  C-?
;; ac-complete
;; ac-expand
;; ac-stop complete C-g
;;(define-key ac-completing-map "\M-/" 'ac-stop)
(define-key ac-mode-map (kbd "C-/") 'auto-complete)
(define-key ac-mode-map (kbd "C-_") 'auto-complete)
(define-key ac-mode-map (kbd "C-c _") 'auto-complete)
(define-key ac-mode-map (kbd "C-c /") 'auto-complete)
(global-set-key (kbd "C-_") 'auto-complete)
(global-set-key (kbd "C-c _") 'auto-complete)
(global-set-key (kbd "C-c /") 'auto-complete)


(global-set-key (kbd "C-x <right>") 'my-next-user-buffer)
(global-set-key (kbd "C-x <left>") 'my-prev-user-buffer)


(use-package 
  auto-complete-nxml 
  :ensure t 
  :config (setq auto-complete-nxml-automatic-p nil))

(use-package 
  jinja2-mode 
  :ensure t)

(use-package 
  fish-mode 
  :ensure t)

(use-package 
  markdown-mode 
  :ensure t)

(use-package 
  yaml-mode 
  :ensure t)

(use-package
  python-black
  :demand t
  :after python
  :config (setq python-black-command "/home/pgb/bin/black"))

;;(use-package web-mode :ensure t)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-current-element-highlight 1)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


(use-package 
  magit 
  :ensure t 
  :bind (("C-x g" . magit-status) ;; Display the main magit popup
         ("C-x M-g" . magit-dispatch-popup))) ;; Display keybinds for magit

(use-package 
  jedi 
  :ensure t 
  :config (add-hook 'python-mode-hook 'jedi:setup) 
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  ;;(setq-default jedi:setup-keys t)
  (setq-default jedi:complete-on-dot nil))


;; move windows with shift+arrow
(windmove-default-keybindings 'shift)

(put 'upcase-region 'disabled nil)

(show-paren-mode t)
(setq visible-bell nil)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-default-buffer-method 'selected-window)

(require 'move-lines)
(move-lines-binding)

(load-library "hideshow")
    (global-set-key (kbd "C-c -") 'hs-hide-block)
    (global-set-key (kbd "C-c =") 'hs-show-block)

(require 'neotree)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
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

;; old deprecated unavailable
;;(require 'mmm-auto)
;;(setq mmm-global-mode 'maybe)
;;(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
;;(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
;;(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

;;(global-flycheck-mode)
(use-package 
  flycheck 
  :ensure t 
  :init (global-flycheck-mode t))
(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))


(dolist (hook '(text-mode-hook)) 
  (add-hook hook (lambda () 
                   ;(linum-mode) 
                   (flyspell-mode -1)
                   )))

(dolist (hook '(change-log-mode-hook log-edit-mode-hook)) 
  (add-hook hook (lambda () 
                   (flyspell-mode -1))))

;; ispell/aspel
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

(require 'pyimpsort)
(defun python-custom() 
  "My custom python-mode-hook."
  (flyspell-prog-mode) 
  
  (flycheck-mode +1)
  (setq flycheck-python-flake8-executable "/home/pgb/bin/flake8")
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
                                        ;(require 'py-autopep8)

  ; 1) virtualenvwrapper
  (require 'virtualenvwrapper)
  (setq venv-dirlookup-names '())
  (setq venv-location "/home/pgb/workspace/python/venvs/")
  (setq projectile-switch-project-action 'venv-projectile-auto-workon)
  (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
  (setq-default mode-line-format (remove 'mode-line-buffer-identification mode-line-format))
  (add-hook 'venv-postactivate-hook 'jedi:stop-server)
  (add-hook 'venv-postdeactivate-hook 'jedi:stop-server)

  ; or 2) pyenv-mode
  ;(require 'pyenv-mode)
  ;(defun projectile-pyenv-mode-set ()
  ;"Set pyenv version matching project name."
  ;(let ((project (projectile-project-name)))
  ;  (if (member project (pyenv-mode-versions))
  ;      (pyenv-mode-set project)
  ;    (pyenv-mode-unset))))
  ;(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

  ; or 3) pyvenv used by elpy
  ; (require 'pyvenv)


  (local-unset-key (kbd "C-_")) 
  (local-unset-key (kbd "C-c _")) 
  (local-unset-key (kbd "C-c /")) 
  (local-set-key (kbd "C-_") 'jedi:complete) 
  (local-set-key (kbd "C-c _") 'jedi:complete) 
  (local-set-key (kbd "C-c /") 'jedi:complete) 
  (local-set-key (kbd "C-.") 'jedi:goto-definition) 
  (local-set-key (kbd "C-c .") 'jedi:goto-definition) 
  (local-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker) 
  (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker) 
  (local-set-key (kbd "C-c d") 'jedi:show-doc)

  (setq indent-tabs-mode f)
  (setq-default tab-width 4)
  (setq tab-width 4)
)
(add-hook 'python-mode-hook 'python-custom)
(eval-after-load 'python '(define-key python-mode-map (kbd "C-c C-i") #'pyimpsort-buffer))


(defun js-custom () 
  "My custom js-mode-hook."
  (flyspell-prog-mode) 
  (setq js-indent-level 2) 
  (setq mode-require-final-newline nil) 
  (local-unset-key (kbd "C-_")) 
  (local-unset-key (kbd "C-c _")) 
  (local-unset-key (kbd "C-c .")) 
  (local-unset-key (kbd "C-c ,")) 
  (local-set-key (kbd "C-_") 'tern-completion-at-point) 
  (local-set-key (kbd "C-c _") 'tern-completion-at-point) 
  (local-set-key (kbd "C-c /") 'tern-completion-at-point) 
  (local-set-key (kbd "C-.") 'tern-find-definition) 
  (local-set-key (kbd "C-c .") 'tern-find-definition) 
  (local-set-key (kbd "C-,") 'tern-pop-find-definition) 
  (local-set-key (kbd "C-c ,") 'tern-pop-find-definition) 
  (push '("function" . ?ƒ) prettify-symbols-alist) 
  (prettify-symbols-mode) 
  (tern-mode t))
(add-hook 'js-mode-hook 'js-custom)


(defun php-custom() 
  "My custom php-mode."
  (local-set-key (kbd "C-d") nil))
(add-hook 'php-mode-hook 'php-custom)


(defun markdown-custom() 
  "My custom markdown-mode."
  (local-set-key (kbd "C-d") nil)
  (setq indent-tabs-mode f)
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
  (rainbow-delimiters-mode) 
  (local-set-key (kbd "C-d") nil))
(add-hook 'emacs-lisp-mode-hook 'elisp-custom)

(add-hook 'prog-mode-hook (lambda () 
                            (hs-minor-mode) 
                            ;(linum-mode) 
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
  (setq typescript-indent-level
        (or (plist-get (tide-tsfmt-options) ':indentSize) 2))
  (local-unset-key (kbd "C-c ."))
  (local-unset-key (kbd "C-c ,"))
  (local-set-key (kbd "C-c .") 'tide-jump-to-definition)
  (local-set-key (kbd "C-c ,") 'tide-jump-back)

;;  "indentSize": 2,
;;  "tabSize": 2,
;;  "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
;;  "placeOpenBraceOnNewLineForFunctions": false,
;;  "placeOpenBraceOnNewLineForControlBlocks": false

  (setq tide-format-options '(
    :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
    :indentSize 2
    :tabSize 2
    :placeOpenBraceOnNewLineForControlBlocks nil
    :placeOpenBraceOnNewLineForFunctions nil))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keys

;; C-x C-b -> ibuffer-list-buffers zamiast helm-buffers
(defalias 'list-buffers 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () 
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

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x k") 'my-kill-current-buffer)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)
;; C-x C-u  upcase-region
;; C-x C-l  downcase-region

;; zamiast key-binda jest ibuffer modede hook
;;(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
;; to nie działa bo ESC jest jako meta
;;(define-key helm-map (kbd "ESC") 'helm-keyboard-quit)

(global-set-key (kbd "C-.") 'xref-find-definitions)
(global-set-key (kbd "C-c .") 'xref-find-definitions)

(global-set-key (kbd "C-<tab>") nil)

(require 'my-move-word)
(global-set-key (kbd "C-<left>") 'my-backward-word)
(global-set-key (kbd "C-<right>") 'my-forward-word)


(global-unset-key (kbd "C--"))
(global-unset-key (kbd "C-="))

(put 'dired-find-alternate-file 'disabled nil)

(message "Hej ho, all done, %s%s" (user-login-name) ".")
;;; .emacs ends here
