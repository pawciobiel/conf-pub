;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; pgb emacs file :-) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
 '(js-enabled-frameworks (quote (javascript)))
 '(js-indent-level 2)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (flycheck-rust rust-mode yapfify imenu-list dired dired-single pyvenv tern rainbow-delimiters use-package fish-mode web-mode restclient elisp-format restclient flycheck yaml-mode handlebars-mode jinja2-mode mmm-jinja2 mmm-mako mmm-mode mustache pyimpsort go-autocomplete go-mode neotree dired-narrow ac-php sql-indent php-mode ac-ispell sphinx-doc sphinx-mode markdown-mode auto-complete-nxml auto-complete-rst pydoc paradox nose nginx-mode magit json-mode jedi ido-vertical-mode helm-projectile helm-ispell epic)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "dim gray"))))
 '(font-lock-comment-face ((t (:foreground "dim gray"))))
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

;;(recentf-mode 1)
;;(setq-default recent-save-file "~/.emacs.d/recentf")
;; zamiast recentf-mode mam desktop save
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my defuns

(defun kill-other-buffers() 
  "Kill all other buffers." 
  (interactive) 
  (mapc 'kill-buffer (delq (current-buffer) 
                           (buffer-list))))

(defun my-kill-current-buffer() 
  "Kill current buffer" 
  (interactive) 
  (kill-buffer (current-buffer)))

(defun duplicate-line() 
  "Duplicate line" 
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
  (interactive)
  (term "/home/pgb/bin/ipython"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load-file "~/.emacs.d/lisp/fill-column-indicator.el")
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode 
  (lambda () 
    (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-width 1)
(setq fci-rule-column 79)
(setq fci-rule-color "darkblue")

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

(require 'dired)
(setq dired-use-ls-dired nil)
;;(require 'dired-single)
;(require 'dired+)
;(setq diredp-bind-problematic-terminal-keys nil)
(defun dired-custom() 
  "konfig dired-mode"
  (diredp-toggle-find-file-reuse-dir t)
  (local-set-key (kbd "M-O") nil))
(add-hook 'dired-mode-hook 'dired-custom)
(eval-after-load 'dired-mode '(define-key dired-mode-map (kbd "M-O") nil))

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

(require 'helm-projectile)
(helm-projectile-on)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start nil) ;; I'll use trigger key

(require 'helm)
(setq helm-boring-buffer-regexp-list (quote (  "\\Minibuf.+\\*" "\\` " "\\*.+\\*")))

;; to mi duplikuje zmiane buffora a wole miec chyba helm-buffer
;;(require 'popwin)
;;(popwin-mode 1)
;;(setq display-buffer-function 'popwin:display-buffer)
;;(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
;;(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)

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

;;(use-package web-mode :ensure t)

(use-package 
  magit 
  :ensure t 
  :bind (("C-x g" . magit-status) ;; Display the main magit popup
         ("C-x M-g" . magit-dispatch-popup))) ;; Display keybinds for magit

;;(require 'jedi)
;;(add-to-list 'ac-sources 'ac-source-jedi-direct)
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot nil)
(use-package 
  jedi 
  :ensure t 
  :config (add-hook 'python-mode-hook 'jedi:setup) 
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  ;;(setq-default jedi:setup-keys t)
  (setq-default jedi:complete-on-dot nil))

;; ispell/aspel
(setq ispell-list-command "--list") ;; aspel uzywa --list
(defun fd-switch-dictionary() 
  (interactive) 
  (let* ((dic ispell-current-dictionary) 
         (change (if (string= dic "en_GB") "polish" "en_GB"))) 
    (ispell-change-dictionary change) 
    (message "Dictionary switched from %s to %s" dic change)))

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

(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

;;(global-flycheck-mode)
(use-package 
  flycheck 
  :ensure t 
  :init (global-flycheck-mode t))
(add-hook 'after-init-hook 'global-flycheck-mode)

(eval-after-load "auto-complete" '(progn (ac-ispell-setup)))

(dolist (hook '(text-mode-hook)) 
  (add-hook hook (lambda () 
                   (linum-mode) 
                   (flyspell-mode))))

(dolist (hook '(change-log-mode-hook log-edit-mode-hook)) 
  (add-hook hook (lambda () 
                   (flyspell-mode -1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prog modes

(require 'pyimpsort)
(defun python-custom() 
  "python-mode-hook"
  (flyspell-prog-mode) 
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
  "js-mode-hook"
  (flyspell-prog-mode) 
  (setq js-indent-level 2) 
  (local-unset-key (kbd "C-_")) 
  (local-unset-key (kbd "C-c _")) 
;;  (local-set-key (kbd "C-_") 'tern-completion-at-point) 
  (local-set-key (kbd "C-_") 'tern-completion-at-point) 
  (local-set-key (kbd "C-c _") 'completion-at-point) 
  (local-set-key (kbd "C-c /") 'completion-at-point) 
  ;;(local-set-key (kbd "C-.") 'js-find-symbol) 
  (local-set-key (kbd "C-.") 'tern-find-definition) 
  (local-set-key (kbd "C-c .") 'tern-find-definition) 
  (local-set-key (kbd "C-,") 'tern-pop-find-definition) 
  (local-set-key (kbd "C-c ,") 'tern-pop-find-definition) 
  (local-set-key (kbd "C-c d") 'tern-get-docs)
  (local-set-key (kbd "C-c t") 'tern-get-type)
  (local-set-key (kbd "C-c r") 'tern-rename-variable)
  (push '("function" . ?ƒ) prettify-symbols-alist) 
  (prettify-symbols-mode) 
  (tern-mode t))
(add-hook 'js-mode-hook 'js-custom)

(defun php-custom() 
  "konfig php-mode"
  (local-set-key (kbd "C-d") nil))
(add-hook 'php-mode-hook 'php-custom)

(defun elisp-custom() 
  "konfig elisp-mode"
  (rainbow-delimiters-mode) 
  (local-set-key (kbd "C-d") nil))
(add-hook 'emacs-lisp-mode-hook 'elisp-custom)

(add-hook 'prog-mode-hook (lambda () 
                            (linum-mode) 
                            (flyspell-prog-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keys

;; C-x C-b -> ibuffer-list-buffers zamiast helm-buffers
(defalias 'list-buffers 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () 
                               (ibuffer-auto-mode 1)))

(global-set-key (kbd "<f7>")   'fd-switch-dictionary)

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
;;(define-key helm-map (kbd "ESC") 'helm-keyboard-quit) to coś nie działa

(global-set-key (kbd "C-.") 'xref-find-definitions)
(global-set-key (kbd "C-c .") 'xref-find-definitions)
(global-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
(global-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
(global-set-key (kbd "C-c d") 'jedi:show-doc)


(define-key ac-mode-map (kbd "C-_") 'auto-complete)
(define-key ac-mode-map (kbd "C-c _") 'auto-complete)
(global-set-key (kbd "C-_") 'auto-complete)
(global-set-key (kbd "C-c _") 'auto-complete)

(global-set-key (kbd "C-<tab>") nil)

(global-set-key (kbd "<f8>") 'neotree-toggle)
;;(global-set-key (kbd "<f8>") 'neotree-project-dir)

(require 'imenu-list)
(global-set-key (kbd "<f9>") 'imenu-list-smart-toggle)

(require 'my-move-word)
(global-set-key (kbd "C-<left>") 'my-backward-word)
(global-set-key (kbd "C-<right>") 'my-forward-word)

;;;the end
