(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	          '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/joshminit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (coffee-mode json-mode django-manage django-mode django-snippets py-autopep8 company-jedi jedi-core elpy jedi indium rainbow-delimiters nlinum-hl org-evil tide google-this ag xref-js2 js2-refactor evil-org avy spaceline telephone-line ggtags evil-easymotion sublimity zenburn-theme yasnippet which-key vue-mode use-package tablist smartparens skewer-mode rjsx-mode ranger racer projectile powerline ox-twbs org-bullets nlinum neotree magit intero iedit google-c-style glsl-mode flymake-rust flycheck-rust evil-tutor emmet-mode counsel company-tern company-irony-c-headers company-irony company-c-headers android-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
