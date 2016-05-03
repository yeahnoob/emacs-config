(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages-list
    '(
      async
      epl
      dash

      solarized-theme
      paredit
      autopair
      rainbow-delimiters
      closure-lint-mode

      magit
      popup
      magit-popup
      
      evil
      evil-paredit
      evil-numbers
      linum
      linum-relative

      yaml-mode
      julia-mode
      toml-mode
      toml

      web-mode
      web-completion-data
      web-beautify
      tagedit

      jq-mode

      rust-mode
      rustfmt
      racer
      cargo

      clojure-mode
      clojure-mode-extra-font-locking
      projectile
      clojure-cheatsheet
      cider
      4clojure

      go-mode

      flymake-yaml
      flymake-rust
      flymake-go
      flymake-easy
      flycheck
      flycheck-rust
      flycheck-clojure

      company
      company-web
      company-racer
      company-go))

(dolist (p my-packages-list)
  (when (not (package-installed-p p))
  (package-install p)))

(require 'solarized)
(when window-system (load-theme 'solarized-dark t))
(when (not window-system) (load-theme 'tango-dark t))

(require 'evil)
(evil-mode 1)
(linum-relative-global-mode 1)

(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Trun on pseudo-structural editing")
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'paredit-mode-hook #'rainbow-delimiters-mode)
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode)

(require 'company)
(add-hook 'after-init-hook #'global-company-mode)

(tool-bar-mode 0)

(when window-system (set-frame-font "-PfEd-Ricty Diminished Discord-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1") (set-frame-size (selected-frame) 120 45))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
