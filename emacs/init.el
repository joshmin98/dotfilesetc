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
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (zenburn1)))
 '(custom-safe-themes
   (quote
    ("1d9d22b492ffce46de8321c66e4e9088e2c5c873e9f75b505ee12884806ec3eb" "b6210a6eb320ffead1a7153dc0c6a0052c299a23ca9a2b579c36715a759bf0e7" "cc3f9eb351f5349a90971538ee98d9a4853b0d9a59b60ebc8cd84e360e8780eb" "6ab6e5b5342f80f2eccaee52b6434671c861c4647064ae9be743c1cdaaeb9bdf" "6372fa8489b7ce01596da550eaaf6f27ce7ae21def646d7bdbc3b0aba2a17186" "2fca9a1b01abad75e54e4ada090488d6651c39f9ca21fb0b66147551e951c526" "cd48f840a8fbfe1fa0f448b539655171d8243ca87d20c8f8af3dcd47390d0efe" "52436972bf92010dff106f93c431331c28550166a20a5bf28bf9138e665bcc45" "75cfc375250e15ad95cefd3195477ec668adde12d1d4402c0130e3e51e33bf5e" "46d9a7b2631f3f2d1ef008abc88bd6f1ad5ac5edb1282c034fbfed4faa57d8bc" "89dd0329d536d389753111378f2425bd4e4652f892ae8a170841c3396f5ba2dd" "1e9001d2f6ffb095eafd9514b4d5974b720b275143fbc89ea046495a99c940b0" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "9240e71034689655a6c05c04063af2c90d0a831aa4e7ca24c8b6e29b5a2da946" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(eclim-eclipse-dirs (quote ("~/eclipse/java-photon/eclipse")))
 '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
 '(elpy-rpc-python-command "/home/joshmin/anaconda3/bin/python")
 '(fci-rule-color "#383838")
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-sideline-enable nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (company-go flymake flymake-cursor paredit cider lsp-java smooth-scroll react-snippets crystal-mode lsp-ui evil-collection nasm-mode company-lsp lsp-ruby lsp-rust yasnippet-snippets ensime scala-mode mmm-mode company-racer elm-yasnippets abl-mode elm-mode handlebars-mode ember-mode 2048-game volatile-highlights dimmer highlight-symbol highlight-thing speed-type exec-path-from-shell arjen-grey-theme evil-magit meghanada cl-lib doom-modeline doom-themes noflet nord-theme solidity-mode aggressive-indent merlin quelpa quelpa-use-package js-format web-mode highlight-parentheses company-lua lua-mode dashboard coffee-mode json-mode django-manage django-mode django-snippets py-autopep8 company-jedi jedi-core elpy jedi indium rainbow-delimiters nlinum-hl org-evil tide google-this ag xref-js2 js2-refactor evil-org avy spaceline telephone-line ggtags evil-easymotion sublimity zenburn-theme yasnippet which-key vue-mode use-package tablist smartparens skewer-mode rjsx-mode ranger racer projectile powerline ox-twbs org-bullets nlinum neotree magit intero iedit google-c-style glsl-mode flymake-rust flycheck-rust evil-tutor emmet-mode counsel company-tern company-irony-c-headers company-irony company-c-headers android-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(python-shell-interpreter "python3")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro for Powerline" :foundry "ADBO" :slant normal :weight normal :height 113 :width normal)))))
