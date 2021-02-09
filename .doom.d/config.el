;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "John Angelis"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
;;(setq doom-font (font-spec :family "monospace" :size 14)
;;      doom-variable-pitch-font (font-spec :family "sans"))

(setq doom-font (font-spec :family "TerminessTTF Nerd Font" :size 15))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
;; Setting the theme
(setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-city-lights)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.



;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(require 'rainbow-delimiters)
(setq rainbow-delimiters-mode t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (setq-default fill-column 80)

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
;;(setq conda-anaconda-home (expand-file-name "~/miniconda3"))
;;(setq conda-env-home-directory (expand-file-name "~/miniconda3"))

(defun open-terminal-in-workdir ()
  (interactive)
  (let ((workdir (if (projectile-project-root)
                     (projectile-project-root)
                   default-directory)))
    (call-process-shell-command
     (concat "urxvt -cd " workdir) nil 0)))



(global-set-key (kbd "C-c t") 'open-terminal-in-workdir)

;; From http://tuhdo.github.io/c-ide.html
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)
;; (semantic-add-system-include "/home/john/Programs/ROOT/include" 'c++-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(add-hook 'c++-mode (setq-default tab-width 2))

(load! "/usr/share/clang/clang-format.el")
(require 'clang-format)
;;(add-load-path! "/usr/share/clang/clang-format.el")
;;(load "/usr/share/clang")
(setq exec-path (append exec-path '("/bin/clang-format")))
(add-to-list 'clang-format-style "LLVM")
;;(require 'clang-format)
(global-set-key [C-m-tab] 'clang-format-buffer)



;;(require 'auto-complete-c-headers)

(setenv "WORKON_HOME" "/home/john/miniconda3/")
(pyvenv-mode 1)


;; Enable elpy
;;(pyvenv-activate "~/miniconda3/")
;;(setq elpy-rpc-python-command "python")
;;(setq elpy-rpc-virtualenv-path 'current)

;;(elpy-enable)  
;;(setq elpy-rpc-backend "jedi")

;; (add-to-list 'company-backends 'company-c-headers)
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "~/Programs/root6.22/include/")))))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list (expand-file-name "~/Programs/root6.22/include/")))))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-cppcheck-include-path
                           (list (expand-file-name "~/Programs/root6.22/include/")))))
(setq irony-additional-clang-options
      (append '("-std=c++17" "-I" "~/Programs/root6.22/include/") irony-additional-clang-options))



;; (setq lsp-julia-package-dir nil)
;; (require 'lsp-julia) must come after this!


(require 'julia-mode)
(require 'eglot-jl)
;; (push "/path/to/lsp-julia" load-path)
;; (require 'lsp-julia)
;; (require 'lsp-mode)
;; (add-hook 'julia-mode-hook #'lsp-mode)
;; (add-hook 'julia-mode-hook #'lsp)

;; From https://julia-users-zurich.github.io/talks/talk-2018-04/emacs.html
;; (require 'etags-table)
;; (setq etags-table-alist
;;       '(
;;         (".*\\.jl$" "/home/mauro/julia/julia-0.6/TAGS" "/home/mauro/.julia/v0.6/TAGS")
;;         ))
;; (setq tags-case-fold-search nil) ; case sensitive search

;; (add-hook 'julia-mode-hook #'eglot)
(setq eglot-connect-timeout 300)

;; (use-package ggtags
;;   :ensure t
;;   :config
;;   (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (when (derived-mode-p 'c-mode 'c++-mode)
;;                 (ggtags-mode 1)))))


(use-package org-journal
  ;; :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (with-eval-after-load 'org-journal
    (setq org-journal-dir "~/Documents/org/journal/"
          org-journal-date-format "%d.%m.%y %a"
          org-journal-file-format "%m%Y_journal.org"
          org-journal-file-type 'monthly)
    (add-to-list 'org-agenda-files org-journal-dir)
    ))

(setq org-journal-enable-agenda-integration t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(setq c-basic-offset 4)
(setq c-indent-level 2)

(defalias 'doc-view #'pdf-tools-install)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-install))
(setq indent-tabs-mode nil)


(add-to-list 'load-path "~/Documents/projects/Github/bm/tools/")
(require 'basm-mode)

(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Documents/org/notes")
  :bind (:map org-roam-mode-map
         (("C-c n l" . org-roam)
          ("C-c n f" . org-roam-find-file)
          ("C-c n g" . org-roam-graph))
         :map org-mode-map
         (("C-c n i" . org-roam-insert))
         (("C-c n I" . org-roam-insert-immediate))))

(use-package! whitespace
  :config
  (setq
   whitespace-style '(face spaces space-mark trailing)
   whitespace-display-mappings '(
                                 (space-mark 32 [183] [46])
                                 )))

(global-whitespace-mode +1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(pdf-view-midnight-colors (cons "#FFFFFF" "#27212E"))
 )

;; (use-package org-ref
;;   :config
;;   (setq
;;    org-ref-completion-library 'org-ref-ivy-cite
;;    org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
;;    ;; org-ref-default-bibliography (list "/home/john/GDrive/zotLib.bib")
;;    ;; org-ref-bibliography-notes "/home/haozeke/Git/Gitlab/Mine/Notes/bibnotes.org"
;;    ;; org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
;;    org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
;;    org-ref-notes-directory (concat (getenv "HOME") "/Documents/org/notes/")
;;    org-ref-notes-function 'orb-edit-notes
;;    ))
(setq
   org_notes (concat (getenv "HOME") "/Documents/org/notes")
   org_notes_papers (concat (getenv "HOME") "/Documents/org/papers")
   ;; org-directory org_notes
   ;; deft-directory org_notes
   ;; org-roam-directory org_notes
   )

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; org-noter-notes-window-location 'other-frame
   ;; org-noter-always-create-frame nil
   org-noter-hide-other nil
   org-noter-notes-search-path (list org_notes org_notes_papers)
   )
  )
