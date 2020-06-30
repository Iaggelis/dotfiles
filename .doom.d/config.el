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

;; (setq doom-font (font-spec :family "DejaVuSansMono Nerd Font" :size 14))
(setq doom-font (font-spec :family "TerminessTTF Nerd Font Mono" :size 14))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
;;(setq doom-theme 'doom-one)
;; Setting the theme
(setq doom-theme 'doom-dracula)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

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
(semantic-add-system-include "/home/john/Programs/ROOT/include" 'c++-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)


(load! "/usr/share/clang/clang-format.el")
(require 'clang-format)
(setq clang-format-fallback-style "LLVM")
;;(add-load-path! "/usr/share/clang/clang-format.el")
;;(load "/usr/share/clang")
(setq exec-path (append exec-path '("/bin/clang-format")))
;;(require 'clang-format)
(global-set-key [C-m-tab] 'clang-format-region)



;;(require 'auto-complete-c-headers)

(setenv "WORKON_HOME" "/home/john/miniconda3/")
(pyvenv-mode 1)


;; Enable elpy
;;(pyvenv-activate "~/miniconda3/")
;;(setq elpy-rpc-python-command "python")
;;(setq elpy-rpc-virtualenv-path 'current)
;;(elpy-enable)

;;(elpy-enable)  
;;(setq elpy-rpc-backend "jedi")
;;

;; (add-to-list 'company-backends 'company-c-headers)

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "~/Programs/root/include/")))))

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list (expand-file-name "~/Programs/root/include/")))))


(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-cppcheck-include-path
                           (list (expand-file-name "~/Programs/root/include/")))))
(setq irony-additional-clang-options
      (append '("-I" "~/Programs/root/include/") irony-additional-clang-options))
