(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;packages
(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-backends (delete 'company-semantic company-backends))
    (define-key c-mode-map [(tab)] 'company-complete)
    (define-key c++-mode-map [(tab)] 'company-complete)
    ))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package google-c-style
  :ensure t)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(use-package irony
  :ensure t)

(use-package company-irony
  :ensure t)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package iedit
  :ensure t)

;(use-package flymake-google-cpplint
;  :ensure t)
;(defun my:flymake-google-cpplint()
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/lib/python2.7/dist-packages/cpplint.py"))
;  (flymake-google-cpplint-load))
;(add-hook 'c-mode-hook 'my:flymake-google-cpplint)
;(add-hook 'c++-mode-hook 'my:flymake-google-cpplint)

(use-package flymake-cursor-mode
  :ensure t)

(use-package ranger
  :ensure t)
(use-package neotree
  :ensure t
  :config
  (progn
    (global-set-key [f8] 'neotree-toggle)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package zenburn-theme
  :ensure t
  :config
  (defvar zenburn-default-colors-alist))
(load-theme 'zenburn t)

(use-package tablist
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package magit
  :ensure t)

(use-package nlinum
  :ensure t)
(setq nlinum-format "%d| ")
(setq nlinum-highlight-current-line t)
(global-nlinum-mode t)

(use-package glsl-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))


;;;;;;;;;;;;;;;;;;
;;Org Mode Stuff;;
;;;;;;;;;;;;;;;;;;
(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package ox-twbs
  :ensure t
  :config
  (defun my-org-publish-buffer ()
  (interactive)
  (save-buffer)
  (save-excursion (org-publish-current-file))
  (let* ((proj (org-publish-get-project-from-filename buffer-file-name))
         (proj-plist (cdr proj))
         (rel (file-relative-name buffer-file-name
                                  (plist-get proj-plist :base-directory)))
         (dest (plist-get proj-plist :publishing-directory)))
    (browse-url (concat "file://"
                        (file-name-as-directory (expand-file-name dest))
                        (file-name-sans-extension rel)
			".html")))))

;;;;;;;;;;;;;;;;;;;;
;;    Web Stuff   ;;
;;;;;;;;;;;;;;;;;;;;
(use-package js2-mode
  :ensure t
  :config
  (setq js2-basic-offset 2))
(require 'js2-mode)
(use-package rjsx-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(use-package company-tern
  :ensure t)
;(require 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode t)
                           (company-mode)))
(use-package emmet-mode
  :ensure t)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(use-package simple-httpd
  :ensure t)
(setq httpd-root "~/Dropbox/Projects/testP5Project")

(use-package skewer-mode
  :ensure t)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(use-package vue-mode
  :ensure t
  :config
  (setq mmm-submode-decoration-level 0))


;;;;;;;;;;;;;;;;;;;;
;;   Rust Stuff   ;;
;;;;;;;;;;;;;;;;;;;;
(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t))

(use-package racer
  :ensure t)

(use-package flymake-easy
  :ensure t)
(use-package flymake-rust
  :ensure t)

(add-hook 'rust-mode-hook 'flymake-rust-load)

(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
(setq racer-cmd "~/.cargo/bin/racer")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'rust-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

;;;;;;;;;;;;;;;;;;;;
;;   Evil Mode    ;;
;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :ensure t
  :config
(evil-mode 1))
(use-package evil-tutor
  :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (glsl-mode flymake-rust flycheck-rust flymake-cursor-mode zenburn-theme yasnippet which-key vue-mode use-package tablist skewer-mode rjsx-mode ranger racer projectile powerline ox-twbs org-bullets nlinum neotree magit intero iedit google-c-style evil emmet-mode counsel company-tern company-irony company-c-headers android-mode))))
