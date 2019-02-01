(defun concat-two-lists (alist blist)
  "Concatenate two lists"
  (if (and (> (length alist) max-lisp-eval-depth) (> (length blist) max-lisp-eval-depth))
      (message "Input lists are not allowed to be longer than %d elements" max-lisp-eval-depth)
    (progn
      (if (cdr alist)
	  (setq blist (concat-two-lists (cdr alist) blist)))
      (cons (car alist) blist))))

(defun concat-multiple-lists (list-of-lists)
  "Concatenate multiple lists"
  (setq begin (car list-of-lists))
  (setq rest (cdr list-of-lists))
  (while rest
    (setq begin (concat-two-lists begin (car rest)))
    (setq rest (cdr rest)))
  (setq output begin))

(defun install-necessary-packages (necessaryPackages)
  "Install the the packages in 'necessaryPackages', if they are not already there"
  (mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
	necessaryPackages))

(defun revert-all-file-buffers ()
  "Refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in emacs will not be reverted. They
will be reverted though if they were modified outside emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      ;; Revert only buffers containing files, which are not modified;
      ;; do not try to revert non-file buffers like *Messages*.
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            ;; If the file exists and is readable, revert the buffer.
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          ;; Otherwise, kill the buffer.
          (let (kill-buffer-query-functions) ; No query done when killing buffer
            (kill-buffer buf)
            (message "Killed non-existing/unreadable file buffer: %s" filename))))))
  (message "Finished reverting buffers containing unmodified files."))

(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
	  (desktop-save-in-desktop-dir)
	(message "Session not saved."))
  (desktop-save-in-desktop-dir)))

(defun delete-desktop ()
  "Delete desktop file without setting desktop-dirname to nil"
  (interactive)
  (setq desktop-dirname-tmp desktop-dirname)
  (desktop-remove)
  (setq desktop-dirname desktop-dirname-tmp))

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

(defun load-ide-desktop (base-name)
  "Load the desktop file 'base-name'"
  (setq desktop-base-file-name base-name)
  (if (saved-session)
	  (if (y-or-n-p "Restore desktop? ")
		  (session-restore))))

(defun load-python-ide-settings ()
  "The settings are altered such that Emacs can be better used as Python IDE"
  (interactive)
  (require 'setup-python))

(defun load-cpp-ide-settings ()
  "The settings are altered such that Emacs can be better used as C/C++ IDE"
  (interactive)
  (require 'setup-cpp))

(require 'ido)
(defun ide-mode-request ()
  "The user is asked which IDE mode he wants"
  (interactive)
  (setq choices '("nil" "c/c++" "python"))
  (setq chosen-ide-mode (message "%s" (ido-completing-read "Choose language: " choices ))))

(defun load-ide-mode ()
  "Prompt user to pick a choice from a list."
  (interactive)
  (setq chosen (ide-mode-request))
  (cond ((equal chosen "nil")
         (load-ide-desktop "emacs-desktop"))
        ((equal chosen "c/c++")
         (load-cpp-ide-settings)
         (load-ide-desktop "emacs-desktop-cpp"))
        ((equal chosen "python")
         (load-ide-desktop "emacs-desktop-python")
         (load-python-ide-settings))))

(provide 'ana-func)