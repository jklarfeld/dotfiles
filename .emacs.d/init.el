; Stop leaving emacs-eggs® all over the file system.
(setq make-backup-files nil)

; Load some dependencies
(add-to-list 'load-path "~/.dot-deps/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))