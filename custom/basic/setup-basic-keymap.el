;; *** Lege das Kompilier-Kommando auf <f5> ***
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; *** Global Set ***
(global-set-key (kbd "C-c w") 'ace-window)
(global-set-key (kbd "<C-right>") 'windmove-right)
(global-set-key (kbd "<C-left>") 'windmove-left)
(global-set-key (kbd "<C-up>") 'windmove-up)
(global-set-key (kbd "<C-down>") 'windmove-down)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Stattdessen den entsprechenden Helm-Command wählen.
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c r") 'helm-recentf)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h w") 'helm-wikipedia-suggest)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "<C-tab>") 'company-complete)

;; *** Semantic Refactor ***
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

;; *** Global Unset ***
(global-unset-key (kbd "C-x c"))

;; *** Help Commands ***
(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; *** Mini Buffer ***
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

;; *** Shell Mode ***
(define-key shell-mode-map (kbd "<C-right>") 'windmove-right)
(define-key shell-mode-map (kbd "<C-left>") 'windmove-left)
(define-key shell-mode-map (kbd "<C-up>") 'windmove-up)
(define-key shell-mode-map (kbd "<C-down>") 'windmove-down)

;; *** Dired Mode ***
(define-key dired-mode-map (kbd "<C-right>") 'windmove-right)
(define-key dired-mode-map (kbd "<C-left>") 'windmove-left)
(define-key dired-mode-map (kbd "<C-up>") 'windmove-up)
(define-key dired-mode-map (kbd "<C-down>") 'windmove-down)

;; *** Org Mode ***
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'setup-basic-keymap)
