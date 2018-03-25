;;; pgb emacs file :-)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4) 
 '(ac-ispell-requires 4) 
 '(ansi-color-faces-vector [default default default italic underline success warning error]) 
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff"
                            "#eeeeec"]) 
 '(custom-enabled-themes nil) 
 '(js-enabled-frameworks (quote (javascript))) 
 '(js-indent-level 2) 
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") 
                            ("marmalade" . "https://marmalade-repo.org/packages/") 
                            ("melpa" . "https://melpa.org/packages/")))) 
 '(package-selected-packages (quote (pyvenv tern rainbow-delimiters web-mode restclient elisp-format
                                            flycheck yaml-mode handlebars-mode mmm-jinja2 mmm-mako
                                            mmm-mode mustache pyimpsort go-autocomplete go-mode
                                            neotree dired-narrow ac-php sql-indent php-mode
                                            ac-ispell sphinx-doc sphinx-mode markdown-mode
                                            auto-complete-nxml auto-complete-rst pydoc paradox nose
                                            nginx-mode magit json-mode jedi ido-vertical-mode
                                            helm-projectile helm-ispell flycheck-pyflakes epic))) 
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t 
                                      (:foreground "dim gray")))) 
 '(font-lock-comment-face ((t 
                            (:foreground "dim gray")))) 
 '(font-lock-doc-face ((t 
                        (:foreground "green")))) 
 '(font-lock-string-face ((t 
                           (:foreground "green")))) 
 '(font-lock-variable-name-face ((t 
                                  (:foreground "white" 
                                               :weight light)))) 
 '(neo-dir-link-face ((t 
                       (:foreground "deep sky blue" 
                                    :slant normal 
                                    :weight bold 
                                    :height 120 
                                    :family "Fantasque Sans Mono")))) 
 '(neo-file-link-face ((t 
                        (:foreground "White" 
                                     :weight normal 
                                     :height 120 
                                     :family "Fantasque Sans Mono")))))

(add-to-list 'load-path "~/.emacs.d/lisp/")

                                        ; js autocompletion
                                        ; http://ternjs.net/doc/manual.html#emacs
(add-to-list 'load-path "~/.emacs.d/tern/")
(autoload 'tern-mode "tern.el" nil t)


                                        ;(load-file "~/.emacs.d/lisp/pdb-current.el")
(load-file "~/.emacs.d/lisp/tophead-line-buffer-name.el")

(defun kill-other-buffers () 
  "Kill all other buffers." 
  (interactive) 
  (mapc 'kill-buffer (delq (current-buffer) 
                           (buffer-list))))

                                        ;(recentf-mode 1)
                                        ;(setq-default recent-save-file "~/.emacs.d/recentf")

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode 
  (lambda () 
    (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-width 1)
(setq fci-rule-column 79)
(setq fci-rule-color "darkblue")

(setq linum-format "%4d \u2502 ")
(when (eq window-system 'x)
                                        ;(color-theme-robin-hood)
  (load-theme 'manoj-dark t)
                                        ;(load-theme 'solarized-dark t)
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
(global-linum-mode 1)

(setq column-number-mode t)

(desktop-save-mode 1)

(setq scroll-step            1 scroll-conservatively  10000)

(which-function-mode 1)



(require 'package)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages)

(require 'projectile)
(projectile-global-mode)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)


(require 'auto-complete-nxml)
                                        ;(setq auto-complete-nxml-automatic-p nil)

(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot nil)

                                        ; to mi duplikuje zmiane buffora a wole miec chyba helm-buffer
                                        ;(require 'popwin)
                                        ;(popwin-mode 1)
                                        ;(setq display-buffer-function 'popwin:display-buffer)
                                        ;(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
                                        ;(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)

(windmove-default-keybindings 'shift)

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


(show-paren-mode t)
(setq visible-bell nil)


(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-default-buffer-method 'selected-window)

(require 'move-lines)
(move-lines-binding)

(global-flycheck-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

(require 'helm-projectile)
(helm-projectile-on)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; modes

(eval-after-load "auto-complete" '(progn (ac-ispell-setup)))

(dolist (hook '(text-mode-hook)) 
  (add-hook hook (lambda () 
                   (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook)) 
  (add-hook hook (lambda () 
                   (flyspell-mode -1))))


(add-hook 'python-mode-hook (lambda () 
                              (flyspell-prog-mode)
                                        ; TODO:
                                        ;(eval-after-load 'python
                                        ;  '(define-key python-mode-map (kbd "C-.") 'jedi:goto-definition)
                                        ;  '(define-key python-mode-map (kbd "C-,") 'jedi:goto-definition-pop-marker)
                                        ;  '(define-key python-mode-map (kbd "C-/") 'jedi:complete)
                                        ;)
                                        ; ...
                              ))

(require 'pyimpsort)
(eval-after-load 'python '(define-key python-mode-map (kbd "C-c C-i") #'pyimpsort-buffer))


(defun js-custom () 
  "js-mode-hook" 
  (setq js-indent-level 2) 
  (flyspell-prog-mode) 
  (local-set-key (kbd "C-c /") 'completion-at-point) 
  (local-set-key (kbd "C-c .") 'js-find-symbol) 
  (push '("function" . ?ƒ) prettify-symbols-alist) 
  (prettify-symbols-mode) 
  (tern-mode t))
(add-hook 'js-mode-hook 'js-custom)

                                        ; js autocomplete via tern + ac - czy to działa?
                                        ;(eval-after-load 'tern
                                        ;   '(progn
                                        ;      (require 'tern-auto-complete)
                                        ;      (tern-ac-setup)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ispell-list-command "--list")     ; aspel uzywa --list
(defun fd-switch-dictionary() 
  (interactive) 
  (let* ((dic ispell-current-dictionary) 
         (change (if (string= dic "en_GB") "polish" "en_GB"))) 
    (ispell-change-dictionary change) 
    (message "Dictionary switched from %s to %s" dic change)))
(global-set-key (kbd "<f7>")   'fd-switch-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default indent-tabs-mode nil)
(setq-default auto-compression-mode nil)
(setq-default auto-encryption-mode nil)
(setq-default tab-width 4)

;;;;;;;;; keys
                                        ; C-x C-b -> ibuffer-list-buffers zamiast helm-buffers
(defalias 'list-buffers 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () 
                               (ibuffer-auto-mode 1)))

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<select>") 'end-of-line)
(defun duplicate-line() 
  (interactive) 
  (move-beginning-of-line 1) 
  (kill-line) 
  (yank) 
  (open-line 1) 
  (next-line 1) 
  (yank))
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-e") 'kill-whole-line)
(global-set-key (kbd "C-x k") 
                (lambda () 
                  (interactive) 
                  (kill-buffer (current-buffer))))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
                                        ; C-x C-u  upcase-region
                                        ; C-x C-l  downcase-region

                                        ; zamiast key-binda jest ibuffer modede hook
                                        ;(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
                                        ;(define-key helm-map (kbd "ESC") 'helm-keyboard-quit) to coś nie działa

(global-set-key (kbd "C-c .") 'jedi:goto-definition)
(global-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
(global-set-key (kbd "C-c d") 'jedi:show-doc)
                                        ;(setq ac-trigger-key "C-c /")
                                        ;(global-auto-complete-mode t)
                                        ;(define-key ac-completing-map (kbd "C-c /") 'ac-complete)
(define-key ac-completing-map (kbd "C-c /") 'jedi:complete)
(global-set-key (kbd "C-_") 'nil)
(global-set-key (kbd "C-c _") 'jedi:complete)
(global-set-key (kbd "C-c /") 'jedi:complete)

(global-set-key (kbd "C-<tab>") nil)
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

(setq helm-boring-buffer-regexp-list (quote (  "\\Minibuf.+\\*" "\\` " "\\*.+\\*")))
(put 'upcase-region 'disabled nil)

(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)
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
(global-set-key (kbd "<f8>") 'neotree-project-dir)


                                        ;(add-hook 'isearch-mode-end-hook 'recenter-top-bottom)
                                        ;(defadvice
                                        ;  isearch-repeat-forward
                                        ;  (after isearch-repeat-forward-recenter activate)
                                        ;  (recenter-top-bottom))
                                        ;
                                        ;(defadvice
                                        ;  isearch-repeat-backward
                                        ;  (after isearch-repeat-backward-recenter activate)
                                        ;  (recenter-top-bottom))
                                        ;
                                        ;(ad-activate 'isearch-repeat-forward)
                                        ;(ad-activate 'isearch-repeat-backward)


;;;the end
