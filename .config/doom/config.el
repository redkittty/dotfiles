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
      :desc "List of Emojis"         "e e" #'emoji-list)
(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq display-line-numbers-type 1)

(setq shell-file-name "/bin/fish"
      vterm-max-scrollback 5000)
(map! :leader
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle)

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer" "t e" #'neotree-toggle)

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))

(map! :leader
      :desc "opens elfeed rss reader" "t t" #'elfeed)
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
                    ("https://www.networkworld.com/feed/" networkworld)
                    ("https://www.counter-strike.net/news/updates" cs2 news))))

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
