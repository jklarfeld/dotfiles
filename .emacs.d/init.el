; Stop leaving emacs-eggs® all over the file system.
(setq make-backup-files nil)

; Melpa
(require 'package)

(add-to-list 'package-archives
	     '("MELPA Stable" . "https://melpa.org/packages/") t)
(package-initialize)

; Load some dependencies
(add-to-list 'load-path "~/.dot-deps/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(use-package flycheck
	     :ensure t
	     :init (global-flycheck-mode))

(eval-after-load 'flycheck '(flycheck-swift-setup))
