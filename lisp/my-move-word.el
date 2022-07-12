;;; package --- Sumary
;;; Code:
;;; Commentary:
;;;

(defun my-backward-word () 
  "Move cursor left to next word or begining of line." 
  (interactive) 
  (if (string-match "[A-Za-z0-9]+" (substring (thing-at-point 'line t) 0 (current-column))) 
      (left-word) 
    (if (eq (point) 
            (line-beginning-position)) 
        (end-of-line 0) 
      (beginning-of-line))))

(defun my-forward-word () 
  "Move cursor to next word or end of line." 
  (interactive) 
  (if (string-match "[A-Za-z0-9]+" (thing-at-point 'line t) 
                    (current-column)) 
      (right-word) 
    (if (eq (point) 
            (line-end-position)) 
        (right-word) 
      (end-of-line))))

(global-set-key (kbd "C-<left>") 'my-backward-word)
(global-set-key (kbd "C-<right>") 'my-forward-word)
(provide 'my-move-word)

;; end
