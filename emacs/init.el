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
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (solidity-mode aggressive-indent merlin quelpa quelpa-use-package js-format web-mode highlight-parentheses company-lua lua-mode dashboard coffee-mode json-mode django-manage django-mode django-snippets py-autopep8 company-jedi jedi-core elpy jedi indium rainbow-delimiters nlinum-hl org-evil tide google-this ag xref-js2 js2-refactor evil-org avy spaceline telephone-line ggtags evil-easymotion sublimity zenburn-theme yasnippet which-key vue-mode use-package tablist smartparens skewer-mode rjsx-mode ranger racer projectile powerline ox-twbs org-bullets nlinum neotree magit intero iedit google-c-style glsl-mode flymake-rust flycheck-rust evil-tutor emmet-mode counsel company-tern company-irony-c-headers company-irony company-c-headers android-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
