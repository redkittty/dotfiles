(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 13)
      doom-variable-pitch-font (font-spec :family "Fira Code Nerd Font" :size 13)
      doom-big-font (font-spec :family "Fira Code Nerd Font" :size 20))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(beacon-mode 1)

(map! :leader
      (:prefix ("b". "buffer")
       :desc "Launch Ibuffer"          "i" #'ibuffer
       :desc "Kills current buffer"    "k" #'kill-buffer
       :desc "Go to previous buffer"   "p" #'previous-buffer
       :desc "Go to next buffer"       "n" #'next-buffer
       :desc "Saves Buffer"            "s" #'save-buffer))

(map! :leader
      :desc "List of Emojis"         "e e" #'emoji-list)
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '((".gif" . "sxiv")
                              (".jpg" . "sxiv")
                              (".png" . "sxiv")
                              (".mkv" . "mpv")
                              (".mp4" . "mpv")))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired in Prompt" "j" #'dired
       :desc "Open dired" "d" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file"           "d v" #'dired-view-file)))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "k") 'peep-dired-next-file
  (kbd "j") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq display-line-numbers-type 1)

(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000)
(map! :leader
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle
      :desc "Vterm fullscreen"       "v f" #'+vterm/here)

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer" "t e" #'neotree-toggle)

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("M" . "minimap")
       :desc "Toggle minimap-mode" "t" #'minimap-mode))

(set-face-attribute 'mode-line nil :font "Fira Code Nerd Font 10")
(setq doom-modeline-height 20     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

(map! :leader
      (:prefix ("f" . "elfeed")
       :desc "opens elfeed rss reader" "f" #'elfeed
       :desc "updated feeds in elfeed" "u" #'elfeed-update))
(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds (quote
                   (("https://reddit.com/r/linux.rss" linux subreddit)
                    ("https://www.reddit.com/r/cs2.rss" cs2 subreddit)
                    ("https://www.reddit.com/r/emacs.rss" emacs subreddit)
                    ("https://www.gamingonlinux.com/article_rss.php" gamingonlinux)
                    ("https://archlinux.org/feeds/news/" archlinux news)
                    ("https://www.reddit.com/r/DoomEmacs.rss" doomemacs subreddit)
                    ("https://www.computerworld.com/feed/" computerworld)
                    ("https://www.networkworld.com/feed/" networkworld))))

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
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

(custom-set-faces!
  '(org-level-1 :height 1.5 :foreground "#B16286")
  '(org-level-2 :height 1.3 :foreground "#8EC07C")
  '(org-level-3 :height 1.2 :foreground "#D4879C")
  '(org-level-4 :height 1.1 :foreground "#83A598")
  '(org-level-5 :height 1.0 :foreground "#EEBD35"))

(custom-set-faces!
  '(markdown-header-face-1 :height 1.5 :foreground "#B16286")
  '(markdown-header-face-2 :height 1.3 :foreground "#8EC07C")
  '(markdown-header-face-3 :height 1.2 :foreground "#D4879C")
  '(markdown-header-face-4 :height 1.1 :foreground "#83A598")
  '(markdown-header-face-5 :height 1.0 :foreground "#EEBD35"))
