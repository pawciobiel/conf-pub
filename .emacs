;;; pgb emacs file :-)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(ac-trigger-key "\\C-\\t")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (go-autocomplete go-mode neotree dired-narrow ac-php sql-indent php-mode ac-ispell sphinx-doc sphinx-mode markdown-mode auto-complete-nxml auto-complete-rst pydoc paradox nose nginx-mode magit json-mode jedi ido-vertical-mode helm-projectile helm-ispell flycheck-pyflakes epic)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'load-path "~/.emacs.d/lisp/")

;(load-file "~/.emacs.d/lisp/pdb-current.el")
(load-file "~/.emacs.d/lisp/tophead-line-buffer-name.el")

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;(recentf-mode 1)
;(setq-default recent-save-file "~/.emacs.d/recentf")

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-width 1)
(setq fci-rule-column 79)
(setq fci-rule-color "darkblue")

(global-linum-mode 1)
;(setq linum-format "%d ")
(setq linum-format "%4d \u2502 ")

(setq column-number-mode t)

(desktop-save-mode 1)

(setq scroll-step            1
      scroll-conservatively  10000)

(which-function-mode 1)

 

(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
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
        (progn
          (rename-file filename new-name 1)
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


;;;;;;;;;;;; spell check
;; Completion words longer than 4 characters


(eval-after-load "auto-complete"
     '(progn
         (ac-ispell-setup)))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(add-hook 'python-mode-hook
  (lambda ()
    (flyspell-prog-mode)
            ; ...
  )
  )
(setq ispell-list-command "--list")  ; aspel uzywa --list
(defun fd-switch-dictionary()
      (interactive)
      (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "en_GB") "polish" "en_GB")))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)
        ))
    
      (global-set-key (kbd "<f7>")   'fd-switch-dictionary)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun js-custom ()
  "js-mode-hook"
  (setq js-indent-level 4))
(add-hook 'js-mode-hook 'js-custom)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;;;;;;;; keys
; C-x C-b -> ibuffer-list-buffers zamiast helm-buffers
(defalias 'list-buffers 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<select>") 'end-of-line)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-e") 'kill-whole-line)
(global-set-key (kbd "C-x k") (lambda ()
                              (interactive)
                              (kill-buffer (current-buffer))))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'helm-projectile-find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
; zamiast key-binda jest ibuffer modede hook
;(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
;(define-key helm-map (kbd "ESC") 'helm-keyboard-quit) to coś nie działa
(global-set-key (kbd "C-.") 'jedi:goto-definition)
(global-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
(global-set-key (kbd "C-c d") 'jedi:show-doc)
(global-set-key (kbd "C-<tab>") 'jedi:complete)
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
                  )))
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
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
(global-set-key (kbd "<f8>") 'neotree-project-dir)

;;;the end
