;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;; ██████████                         ███               █████
;;░░███░░░░░█                        ░░░               ░░███
;; ░███  █ ░  ████████   █████ █████ ████  █████ █████ ███████   █████ ████
;; ░██████   ░░███░░███ ░░███ ░░███ ░░███ ░░███ ░░███ ░░░███░   ░░███ ░███
;; ░███░░█    ░███ ░███  ░███  ░███  ░███  ░░░█████░    ░███     ░███ ░███
;; ░███ ░   █ ░███ ░███  ░░███ ███   ░███   ███░░░███   ░███ ███ ░███ ░███
;; ██████████ ████ █████  ░░█████    █████ █████ █████  ░░█████  ░░███████
;;░░░░░░░░░░ ░░░░ ░░░░░    ░░░░░    ░░░░░ ░░░░░ ░░░░░    ░░░░░    ░░░░░███
;;                                                                ███ ░███
;;                                                               ░░██████
;;                                                                ░░░░░░
;;

;; ENVIXTY'S DOOM EMACS CONFIGURATION

;; Place your private configuration here! Remember, you do not need to run 'doom sync' after modifying this file!

;;; DOC ;;;
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;

;;; GENERAL ;;;
;; THEME ;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; doom-one if broken

(setq doom-theme 'doom-gruvbox)

;; LINE NUMBERS ;;
;; To disable set to nil, for relative, set to relative

(setq display-line-numbers-type 1)


;;; VTERM ;;;

(setq shell-file-name "/bin/fish"
      vterm-max-scrollback 5000)
(map! :leader
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle)

;;; ORG MODE ;;;
;; GENERAL ;;

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/Documents/Org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("aw" . "https://wiki.archlinux.org/index,php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

;; CUSTOM ORG-MODE FONT SIZE HEADINGS ;;
(custom-set-faces!
  '(org-level-1 :height 1.3 :foreground "#B16286")
  '(org-level-2 :height 1.2 :foreground "#8EC07C")
  '(org-level-3 :height 1.1 :foreground "#D4879C")
  '(org-level-4 :height 1.0 :foreground "#83A598")
  '(org-level-5 :height 1.0 :foreground "#EEBD35"))
