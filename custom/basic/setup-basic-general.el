;; *** Maximieren der Emacs-Frames ***
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; start emacs-server if not running
;; Funktioniert irgendwie noch nicht. Anscheinend hat Emacs bei der Installation
;; irgendwo einen Eintrag erstellt, der dafür sorgt, dass beim Doppelklicken auf eine Datei
;; automatisch eine neue Emacs-Session gestartet wird, ohne dass Einträge in .emacs oder
;; .bashrc beachtet werden
;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (require 'server)
;;             (unless (server-running-p)
;;               (server-start))))

;; *** Die Mode Line wird angepasst
(setq-default mode-line-format
              '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified
               mode-line-remote mode-line-frame-identification mode-line-buffer-identification " (" mode-name ") "
               mode-line-position (vc-mode vc-mode) " "
               ;; (:eval (substring (system-name) 0 (string-match "\\..+" (system-name))))
               ;; ":" default-directory
               ;; mode-line-end-spaces)
              ))

(setq-default mode-line-buffer-identification
              (list (propertize
                     "%12b"
                     'face 'mode-line-buffer-id
                     'help-echo
                     '(format "%s\nmouse-1: Previous buffer\nmouse-3: Next buffer"
                              (buffer-file-name))
                     'mouse-face 'mode-line-highlight
                     'local-map mode-line-buffer-identification-keymap)))

;; *** Zeilennummern aktivieren ***
(global-linum-mode t)

;; *** Die Schriftart auf Ubuntu-Mono einstellen ***
(set-face-attribute 'default nil :font "Ubuntu Mono-14")

;; *** Sicherung von Buffern ***
;; Setze das Verzeichnis für die Backups
(setq
   backup-by-copying t
   backup-directory-alist
   '(("." . "~/.backups"))
)

;; Setze das zeitliche Intervall zwischen automatischen Sicherungen
(setq auto-save-timeout 180)

;; *** Ausschalten der Werkzeug-, Scrollbar- und Menüleiste ***
(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)

;; *** Anschalten der Spalten-Nummer in der Mode Line ***
(column-number-mode 1)

;; *** Verhindere dass der Begrüßungsschirm angezeigt wird ***
(setq inhibit-startup-screen t)

;; *** Mache "Ja-oder-Nein"-Abfragen einfacher ***
(defalias 'yes-or-no-p 'y-or-n-p)

;; *** Automatisches Schließen von Klammern ***
(electric-pair-mode 1)

;; *** Änderungen der Fenster-Konfiguration können rückgängig gemacht werden ***
(winner-mode 1)

;; *** Anzeigen von einander zugehörigen Klammern ***
(show-paren-mode 1)
(setq show-paren-delay 0)

;; *** Benutze Leerzeichen für Einrückungen ***
(setq-default indent-tabs-mode nil)

;; *** Einstellen der Tab-Weite ***
(setq-default tab-width 4)

;; *** Keine Tabs für Einrückungen benutzen ***
(setq-default indent-tabs-mode nil)

;; *** Speichere die Annotationen der Lesezeichen wenn Emacs beendet wird ***
(add-hook 'kill-emacs-hook 'bookmark-save)

;; *** Speichern des Desktops (Quelle: https://www.emacswiki.org/emacs/Desktop)
(setq desktop-load-locked-desktop t)

(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")

(add-hook 'desktop-after-read-hook 'delete-desktop)
(add-hook 'kill-emacs-hook 'session-save)

(provide 'setup-basic-general)
