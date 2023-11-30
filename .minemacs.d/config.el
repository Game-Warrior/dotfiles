;;    _____ __          __
;;  / ____| \ \        / / GameWarrior
;; | |  __   \ \  /\  / /  https://github.com/game-warrior
;; | | |_ |   \ \/  \/ /   @gamewarrior010@social.linux.pizza
;; | |__| |    \  /\  /    https://www.gnu.org/software/emacs/
;;  \_____|     \/  \/     https://github.com/abougouffa/minemacs

;; Set a theme for MinEmacs, supported themes include these from `doom-themes'
;; or built-in themes
(setq minemacs-theme 'doom-solarized-dark-high-contrast)

(setq frame-title-format "Hey bro, just FYI, this buffer is called %b or something like that.")

(+setup-fonts)
;; You can set a list of fonts to be used, like the snippet below. The first
;; font found on the system will be used:
(plist-put minemacs-fonts-plist
           :default ;; <- applies to the `default' face usig `custom-theme-set-faces'
           '((:family "JuliaMono" :height 130) ; <- priority 1
             (:family "JetBrains Mono" :height 110 :weight light) ; <- priority 2
             (:family "Cascadia Code" :height 120 :weight semi-light))) ; <- priority 3

;; To set font for arbitrary Emacs face, you need just to write the face name as
;; a keyword. For example `variable-pitch' -> `:variable-pitch':
(plist-put minemacs-fonts-plist
           :variable-pitch ;; <- applies to the `variable-pitch' face usig `custom-theme-set-faces'
           '("Lato"
             "Roboto"
             "Inter"
             "Helvetica"))

;; For example to set custom font for `mode-line' -> `:mode-line':
(plist-put minemacs-fonts-plist
           :mode-line ;; <- applies to the `mode-line' face usig `custom-theme-set-faces'
           '((:family "Lato" :weight regular)
             (:family "Roboto" :weight light)))

(plist-put minemacs-fonts-plist
           :mode-line-inactive ;; <- applies to the `mode-line-inactive'
           '((:family "Lato" :weight regular)
             (:family "Roboto" :weight light)))

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-18")
(setq doom-modeline-height 25     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-major-mode-icon t  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-enable-word-count '(markdown-mode gfm-mode org-mode fountain-mode) ;; Show word count
      )
;; (setq doom-modeline-time-icon t)
(setq doom-modeline-buffer-file-name-style 'autotruncate-except-project)

(menu-bar-mode -1)

(setq dashboard-startup-banner "~/.emacs.d/assets/images/minemacs.svg")
(setq dashboard-center-content t)
(setq dashboard-items '((recents . 5)
                        (agenda . 5 )
                        (bookmarks . 3)))

(setq word-wrap-mode 1)

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  (general-create-definer gb/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC") ;; access leader in insert mode

  (gb/leader-keys
    "SPC" '(counsel-M-x :wk "Counsel M-x")
    "." '(find-file :wk "Find file")
    "=" '(perspective-map :wk "Perspective") ;; Lists all the perspective keybindings
    "TAB TAB" '(comment-line :wk "Comment lines")
    "u" '(universal-argument :wk "Universal argument"))

  (gb/leader-keys
    "b" '(:ignore t :wk "Bookmarks/Buffers")
    "b b" '(switch-to-buffer :wk "Switch to buffer")
    "b c" '(clone-indirect-buffer :wk "Create indirect buffer copy in a split")
    ;; "b C" '(clone-indirect-buffer-other-window :wk "Clone indirect buffer in new window")
    "b d" '(bookmark-delete :wk "Delete bookmark")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '(kill-current-buffer :wk "Kill current buffer")
    "b K" '(kill-some-buffers :wk "Kill multiple buffers")
    "b l" '(bookmark-jump :wk "Open a Bookmark")
    "b m" '(bookmark-set :wk "Set bookmark")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b R" '(rename-buffer :wk "Rename buffer")
    "b s" '(basic-save-buffer :wk "Save buffer")
    "b S" '(save-some-buffers :wk "Save multiple buffers")
    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file"))

  (gb/leader-keys
    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Open dired")
    "d j" '(dired-jump :wk "Dired jump to current")
    "d p" '(peep-dired :wk "Peep-dired"))

  (gb/leader-keys
    "e" '(:ignore t :wk "Eshell/Evaluate")
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e h" '(counsel-esh-history :which-key "Eshell history")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")
    "e R" '(eww-reload :which-key "Reload current page in EWW")
    "e s" '(eshell :which-key "Eshell")
    "e w" '(eww :which-key "EWW emacs web wowser"))

  (gb/leader-keys
    "f" '(:ignore t :wk "Files")
    "f c" '((lambda () (interactive)
              (find-file "~/.minemacs.d/config.org"))
            :wk "Open emacs config.org")
    "f e" '((lambda () (interactive)
              (dired "~/.minemacs.d/emacs/"))
            :wk "Open user-emacs-directory in dired")
    "f d" '(find-grep-dired :wk "Search for string in files in DIR")
    "f g" '(counsel-grep-or-swiper :wk "Search for string current file")
    "f j" '(counsel-file-jump :wk "Jump to a file below current directory")
    "f l" '(counsel-locate :wk "Locate a file")
    "f r" '(counsel-recentf :wk "Find recent files")
    "f u" '(sudo-edit-find-file :wk "Sudo find file")
    "f U" '(sudo-edit :wk "Sudo edit file"))

  (gb/leader-keys
    "g" '(:ignore t :wk "Git")
    "g /" '(magit-dispatch :wk "Magit dispatch")
    "g ." '(magit-file-dispatch :wk "Magit file dispatch")
    "g b" '(magit-branch-checkout :wk "Switch branch")
    "g c" '(:ignore t :wk "Create")
    "g c b" '(magit-branch-and-checkout :wk "Create branch and checkout")
    "g c c" '(magit-commit-create :wk "Create commit")
    "g c f" '(magit-commit-fixup :wk "Create fixup commit")
    "g C" '(magit-clone :wk "Clone repo")
    "g f" '(:ignore t :wk "Find")
    "g f c" '(magit-show-commit :wk "Show commit")
    "g f f" '(magit-find-file :wk "Magit find file")
    "g f g" '(magit-find-git-config-file :wk "Find gitconfig file")
    "g F" '(magit-fetch :wk "Git fetch")
    "g g" '(magit-status :wk "Magit status")
    "g i" '(magit-init :wk "Initialize git repo")
    "g l" '(magit-log-buffer-file :wk "Magit buffer log")
    "g r" '(vc-revert :wk "Git revert file")
    "g s" '(magit-stage-file :wk "Git stage file")
    "g u" '(magit-stage-file :wk "Git unstage file"))

 (gb/leader-keys
    "h" '(:ignore t :wk "Help")
    "h a" '(counsel-apropos :wk "Apropos")
    "h b" '(describe-bindings :wk "Describe bindings")
    "h c" '(describe-char :wk "Describe character under cursor")
    "h d" '(:ignore t :wk "Emacs documentation")
    "h d a" '(about-emacs :wk "About Emacs")
    "h d d" '(view-emacs-debugging :wk "View Emacs debugging")
    "h d f" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "h d m" '(info-emacs-manual :wk "The Emacs manual")
    "h d n" '(view-emacs-news :wk "View Emacs news")
    "h d o" '(describe-distribution :wk "How to obtain Emacs")
    "h d p" '(view-emacs-problems :wk "View Emacs problems")
    "h d t" '(view-emacs-todo :wk "View Emacs todo")
    "h d w" '(describe-no-warranty :wk "Describe no warranty")
    "h e" '(view-echo-area-messages :wk "View echo area messages")
    "h f" '(describe-function :wk "Describe function")
    "h F" '(describe-face :wk "Describe face")
    "h g" '(describe-gnu-project :wk "Describe GNU Project")
    "h i" '(info :wk "Info")
    "h I" '(describe-input-method :wk "Describe input method")
    "h k" '(describe-key :wk "Describe key")
    "h l" '(view-lossage :wk "Display recent keystrokes and the commands run")
    "h L" '(describe-language-environment :wk "Describe language environment")
    "h m" '(describe-mode :wk "Describe mode")
    "h r" '(:ignore t :wk "Reload")
    "h r r" '((lambda () (interactive)
                (load-file "~/.minemacs.d/config.el")
                (ignore (elpaca-process-queues)))
              :wk "Reload emacs config")
    "h t" '(load-theme :wk "Load theme")
    "h v" '(describe-variable :wk "Describe variable")
    "h w" '(where-is :wk "Prints keybinding for command if set")
    "h x" '(describe-command :wk "Display full documentation for command"))

  (gb/leader-keys
    "m" '(:ignore t :wk "Org")
    "m a" '(org-agenda :wk "Org agenda")
    "m e" '(org-export-dispatch :wk "Org export dispatch")
    "m i" '(org-toggle-item :wk "Org toggle item")
    "m t" '(org-todo :wk "Org todo")
    "m B" '(org-babel-tangle :wk "Org babel tangle")
    "m x" '(org-toggle-checkbox :wk "Org mark checkbox")
    "m l" '(org-cliplink :wk "Insert a link using org-cliplink")
    "m T" '(org-todo-list :wk "Org todo list"))

  (gb/leader-keys
    "m b" '(:ignore t :wk "Tables")
    "m b -" '(org-table-insert-hline :wk "Insert hline in table"))

  (gb/leader-keys
    "m d" '(:ignore t :wk "Date/deadline")
    "m d t" '(org-time-stamp :wk "Org time stamp"))

  (gb/leader-keys
    "o" '(:ignore t :wk "Open")
    "o d" '(dashboard-open :wk "Dashboard")
    "o e" '(elfeed :wk "Elfeed RSS")
    "o f" '(make-frame :wk "Open buffer in new frame")
    "o F" '(select-frame-by-name :wk "Select frame by name")
    "o o" '(reveal-in-osx-finder :wk "Reveal current folder in OSX Finder")
    )

  ;; projectile-command-map already has a ton of bindings
  ;; set for us, so no need to specify each individually.
  (gb/leader-keys
    "p" '(projectile-command-map :wk "Projectile"))

  (gb/leader-keys
    "s" '(:ignore t :wk "Search")
    "s d" '(dictionary-search :wk "Search dictionary")
    "s m" '(man :wk "Man pages")
    "s t" '(tldr :wk "Lookup TLDR docs for a command")
    "s w" '(jinx-correct :wk "Jinx is a fast spell checker for emacs"))

  (gb/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t e" '(eshell-toggle :wk "Toggle eshell")
    "t f" '(flycheck-mode :wk "Toggle flycheck")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "t n" '(synosaurus-choose-and-insert :wk "Lookup and replace under point")
    "t o" '(org-mode :wk "Toggle org mode")
    "t r" '(rainbow-mode :wk "Toggle rainbow mode")
    "t t" '(visual-line-mode :wk "Toggle truncated lines")
    "t v" '(vterm-toggle :wk "Toggle vterm"))

  (gb/leader-keys
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")
    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right"))

  (gb/leader-keys
    "v" '(org-archive-subtree :wk "Archive Org Heading.")
    "y" '(xwidgets-webkit-browse-url :wk "Open a link in xWidgets Webkit")
    )

  )

(setq user-full-name "Gardner Berry"
    user-mail-address "gardner@gardnerberry.com")

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(setq browse-url-browser-function 'browse-url-default-browser)

;; Module: `me-rss' -- Package: `elfeed'
(with-eval-after-load 'elfeed
  ;; Add news feeds for `elfeed'
  (setq elfeed-feeds
        '(
          ;; General
          ("https://frame.work/blog.rss" Framework)
          ("https://factorio.com/blog/rss" Factorio)
          ("https://news.nononsenseapps.com/index.atom" Feeder)
          ("https://kagifeedback.org/atom/t/release-notes" Kagi)
          ("https://news.play.date/index.xml" Playdate)
          ;; Linux
          ("https://blog.linuxmint.com/?feed=rss2" LinuxMint linux)
          ("https://archlinux.org/news/" Arch linux)
          ("https://fedoramagazine.org/feed/" Fedora linux)
          ("https://endeavouros.com/news/" EndeavourOS linux)
          ;; Boat Stuff
          ("https://buffalonickelblog.com/feed/" Buffalo-Nickel boat)
          ("https://mobius.world/feed/" Mobius boat)
          ("https://www.mvuglybetty.com/blog-feed.xml" Ugly-Betty boat)
           ;; Emacs
          ("http://xenodium.com/rss.xml" Xenodium emacs)
          ("https://cmdln.org/post/" Commandline emacs)
          ("https://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" emacs Karal-Voit)
          ("https://systemcrafters.net/rss/news.xml" SystemCrafter emacs)
          ("https://sachachua.com/blog/feed/" SachaChua emacs)
          ("https://rostre.bearblog.dev/feed/?type=rss" ParsingTime emacs)
          ("https://200ok.ch/atom.xml" 200ok emacs)
          ;; ("https://planet.emacslife.com/atom.xml" PlanetEmacsLife emacs)
          ("https://blog.tecosaur.com/tmio/rss.xml" TMiO emacs)
          ;; News
          )))

(use-package elfeed-goodies
  :straight t
  :init
  (elfeed-goodies/setup)
  :config
  (setq elfeed-goodies/entry-pane-size 0.5))

(defun elfeed-xwidgets-open (&optional use-generic-p)
  "open with xWidgets"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (xwidget-webkit-browse-url it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

;; (map! :leader
      ;; :map elfeed-mode-map
     ;; (:desc "Open article form Elfeed in xWidgets" "o w" #'elfeed-xwidgets-open))

(setq package-archive-priorities '(("gnu" . 10)
                                   ("melpa" . 5))
      package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://stable.melpa.org/packages/")
                         ("melpa-devel" . "https://melpa.org/packages/")))

(use-package reveal-in-osx-finder
  :straight t
  )

(use-package yeetube
  :straight t
  )
(setq yeetube-player 'IINA)

(setq bookmark-default-file "~/.minemacs.d/bookmarks")  ; Set the bookmark file
     (setq bookmark-save-flag 1)                         ; Save bookmarks after every change

;; Module: `me-org' -- Package: `org'
(with-eval-after-load 'org
  (setq org-directory "~/Documents/"
        ;; Set where org agenda get todos from
        org-agenda-files '("~/Documents/agenda.org" "~/Documents/To-Research.org" "~/Documents/inbox.org" "~/Documents/notes.org" "~/Documents/books.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        ;; Set where archive org-headings go
        org-archive-location "~/Documents/Archive/archive.org::"
        ;; Set org-ellipsis
        ;; org-ellipsis " ↴ "
        ;; org-ellipsis" ⤷ "
        org-ellipsis " ... "
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "NEXT(n)"           ; This is for something that I am in the process of doing (for example reading a book)
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" ))) ; Task has been cancelled
  )

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(setq org-archive-default-command 'org-archive-subtree)

;;(map! :leader
;;      (:desc "Archive Org-Todos" "v" org-archive-default-command))

(with-eval-after-load 'org
  (setq org-agenda-deadline-leaders '("" "" "%2d d. ago: ")
      org-deadline-warning-days 0
      org-agenda-span 7
      org-agenda-start-day "-0d"
      org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done)
      org-log-done 'time
      )
)

(with-eval-after-load 'org-capture
  (setq org-capture-templates
        '(("t" "todo" entry (file "~/Documents/agenda.org")
           "* TODO %?\n  %i\n  %a")
          ("T" "todo today" entry (file "~/Documents/agenda.org")
           "* TODO %?\n  %i\nDEADLINE: %t\n  %a")
          ("i" "inbox" entry (file "~/Documents/inbox.org")
           "* %?")
          ("v" "clip to inbox" entry (file "~/Documents/inbox.org")
           "* %x%?")
          ("c" "call someone" entry (file "~/Documents/inbox.org")
           "* TODO Call %?\n %U")
          ("p" "phone call" entry (file "~/Documents/inbox.org")
           "* Call from %^{Caller name}\n %U\n %i\n")
          )))

(use-package ox-twbs
  :straight t
  )
(use-package ox-pandoc
  :straight t
  )
(use-package ox-gfm
  :straight t
  )
(use-package org-re-reveal
  :straight t
  )
;; (use-package ox-reveal
  ;; :straight t
  ;; )
(use-package ox-epub
  :straight t
  )
;; Make it so that org-export wont use numbered headings
(setq org-export-with-section-numbers nil)
;; Disable Timestamping
(setq org-export-time-stamp-file nil)

;; Reveal.js + Org mode
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"
      ;; org-reveal-title-slide "<h1>%t</h1><h2>%a</h2><h3>emailme@gardnerberry.com</h3><h5>@Gamewarrior010@social.linux.pizza</h5>"
      org-re-reveal-title-slide "<h1>%t</h1><h2>%a</h2><h3>gardner.berry@crms.org</h3><h5>@Gamewarrior010@social.linux.pizza</h5>"
      ;; org-re-reveal-title-slide "<h1>%t</h1><h2>%a</h2><h3>gardner.berry@crms.org</h3>"
      org-reveal-theme "moon"
      org-re-reveal-theme "moon"
      ;; org-re-reveal-theme "blood"
      org-re-reveal-transition "slide"
      org-reveal-plugins '(markdown notes math search zoom))

(defun set-ignored-headlines-tags (backend)
     "Remove all headlines with tag ignore_heading in the current buffer.
        BACKEND is the export back-end being used, as a symbol."
     (cond ((org-export-derived-backend-p backend 'md) (setq  org-export-exclude-tags '("noexport" "mdignore")))
           ((org-export-derived-backend-p backend 'reveal) (setq  org-export-exclude-tags '("noexport" "revealignore")))
           (t (setq  org-export-exclude-tags '("noexport")))
       ))

(use-package org-auto-tangle
  :straight t
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
  )

(load "~/.config/doom/org-novelist.el")
    (setq org-novelist-language-tag "en-US"  ; The interface language for Org Novelist to use. It defaults to 'en-GB' when not set
          org-novelist-author "Gardner Berry")  ; The default author name to use when exporting a story. Each story can also override this setting
          ;; org-novelist-author-email "gardner@gamewarrior.xyz"  ; The default author contact email to use when exporting a story. Each story can also override this setting
          ;; org-novelist-automatic-referencing-p nil)  ; Set this variable to 't' if you want Org Novelist to always keep note links up to date. This may slow down some systems when operating on complex stories. It defaults to 'nil' when not set

(use-package toc-org
  :straight t
  :hook (org-mode . toc-org-mode)
  :hook (markdown-mode . toc-org-mode)
  )

(use-package org-superstar
  :straight t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?- . ?➤) (?+ . ?✦)) ; changes +/- symbols in item lists
)
)

(use-package org-cliplink
  :straight t
  )

(use-package org-contrib
  :straight t
  )

;; (use-package org-tempo)

(load "~/.config/doom/typing-practice.el")

(defadvice practice-typing (around no-cursor activate)
  "Do not show cursor at minibuffer during typing practice."
  (let ((minibuffer-setup-hook
         (cons (lambda () (setq cursor-type nil))
               minibuffer-setup-hook)))
    ad-do-it))

(setq nov-unzip-program (executable-find "bsgbar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(use-package olivetti
  :straight t
  )
(setq olivetti-style 'fringes-and-margins)

(use-package palimpsest
  :straight t
  )
(add-hook 'text-mode-hook 'palimpsest-mode)

;; (map!
       ;; :leader
      ;; (:desc "Palimpsest-Send-Bottom" "n g" palimpsest-send-bottom))

;; Enable abbreviation mode
  (dolist (hook '(org-mode-hook
                    text-mode-hook))
      (add-hook hook #'abbrev-mode))
(quietly-read-abbrev-file "~/.minemacs.d/abbrev_defs")

(use-package yasnippet
  :straight t
  )
(setq yas-snippet-dirs '("~/Documents/emacs-stuff/snippets"))
(yas-global-mode 1)

(use-package magit-todos
  :straight t
  :after magit
  :config (magit-todos-mode 1))

(use-package jinx
  :straight t
  :hook (emacs-startup . global-jinx-mode))

(use-package synosaurus
  :straight t
  )

(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(setq eshell-aliases-file "~/.config/doom/eshell/aliases")

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

;; (setq ellama-buffer-mode "org-mode")
(use-package ellama
  :straight t
  )
(setopt ellama-language "English")

(use-package chatgpt-shell
  :straight t
  :config
  (setq chatgpt-shell-openai-key "placeholder")
  )

(use-package mastodon
  :straight t
  :config
  (setq mastodon-instance-url "https://social.linux.pizza"
      mastodon-active-user "Gamewarrior010")
  )

(use-package lem
  :straight t
  :config
(setq lem-instance-url "https://lemmy.world")
(setq lem-current-user "GameWarrior"))

(use-package dired-open
  :straight t
  :config
   (setq dired-open-extensions '(("gif" . "sxiv")
                                 ("jpg" . "sxiv")
                                 ("png" . "sxiv")
                                 ("mkv" . "IINA")
                                 ("mp4" . "IINA"))))

(use-package peep-dired
  :straight t
  :after dired
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)
)

(use-package nerd-icons-dired
  :straight t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package diredfl
  :straight t
  :hook
  (dired-mode . diredfl-mode))



(cond ((eq system-type 'darwin)
       (setq dired-use-ls-dired t
             insert-directory-program "/opt/homebrew/bin/gls"
             dired-listing-switches "-aBhl --group-directories-first")
       ))

(use-package nix-mode
  :straight t
  )

(use-package ob-nix
  :straight t
  )

(use-package nixpkgs-fmt
  :straight t
  )
