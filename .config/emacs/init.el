;;    _____ __          __
;;  / ____| \ \        / / GameWarrior
;; | |  __   \ \  /\  / /  https://github.com/game-warrior
;; | | |_ |   \ \/  \/ /   @gamewarrior010@social.linux.pizza
;; | |__| |    \  /\  /    https://www.gnu.org/software/emacs/
;;  \_____|     \/  \/

(add-to-list 'load-path "~/.config/emacs/scripts/")

(load "~/.config/emacs/scripts/elpaca-setup.el") ;; The Elpaca Package Manager
(load "~/.config/emacs/scripts/buffer-move.el") ;; Buffer-move for better window management

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

  (use-package doom-themes
    :config
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    ;; Sets the default theme to load!!!
    (load-theme 'doom-one t)
    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config))

(use-package timu-rouge-theme
  :ensure t
   )
(use-package ef-themes)
(use-package standard-themes)
(use-package sublime-themes)

(setq frame-title-format "Hey bro, just FYI, this buffer is called %b or something like that.")

(set-face-attribute 'default nil
   :font "JetBrains Mono"
   :height 110
   :weight 'medium)
(set-face-attribute 'variable-pitch nil
 :font "Atkinson Hyperlegible"
 :height 120
 :weight 'medium)
  (set-face-attribute 'fixed-pitch nil
   :font "JetBrains Mono"
   :height 110
   :weight 'medium)

   ;; This sets the default font on all graphical frames created after restarting Emacs.
   ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
   ;; are not right unless I also add this method of setting the default font.
   (add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))

   ;; Uncomment the following line if line spacing needs adjusting.
   ;; (setq-default line-spacing 0.12)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-18")
    (use-package doom-modeline
      :hook (emacs-startup . doom-modeline-mode)
      :init
  (setq doom-modeline-height 25     ;; sets modeline height
	doom-modeline-bar-width 5   ;; sets right bar width
	doom-modeline-major-mode-icon t  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.      doom-modeline-persp-name t  ;; adds perspective name to modeline
	doom-modeline-enable-word-count '(markdown-mode gfm-mode org-mode rst-mode latex-mode tex-mode text-mode) ;; Show word count
	doom-modeline-time-icon t
	doom-modeline-buffer-file-name-style 'autotruncate-except-project
	doom-modeline-modal-icon nil
	doom-modeline-buffer-encoding nil
)
	)

(menu-bar-mode -1)

(tool-bar-mode -1)

(use-package dashboard
  :ensure t
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  (setq dashboard-startup-banner '2) ;; use standard emacs logo as banner
  (setq dashboard-center-content t) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          ))
  :custom
  (dashboard-modify-heading-icons '((recents . "file-text")
              (bookmarks . "book")))
  :config
   (dashboard-setup-startup-hook))

(toggle-truncate-lines -1)
(global-word-wrap-whitespace-mode 1)

(use-package nerd-icons-ibuffer
    :ensure t
    :hook (ibuffer-mode . nerd-icons-ibuffer-mode))
(use-package bufler)

(setq visible-bell t)

(use-package spacious-padding
  :ensure t
  ;; :hook (emacs-startup . spacious-padding-mode)
  )

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
    "SPC" '(execute-extended-command :wk "execute-extended-command")
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
    "b i" '(ibuffer :wk "ibuffer")
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
    "d t" '(dired-create-empty-file :wk "Dired create and empty file")
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
                (load-file "~/.config/emacs/init.el")
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
    "m T" '(org-todo-list :wk "Org todo list")
    "m d" '(org-deadline :wk "Add a deadline to a todo item")
    "m s" '(org-sechedule :wk "Add a scheduled date to a todo item"))

  (gb/leader-keys
    "m b" '(:ignore t :wk "Tables")
    "m b -" '(org-table-insert-hline :wk "Insert hline in table"))

  (gb/leader-keys
    "o" '(:ignore t :wk "Open")
    "o d" '(dashboard-open :wk "Dashboard")
    "o e" '(elfeed :wk "Elfeed RSS")
    "o f" '(make-frame :wk "Open buffer in new frame")
    "o F" '(select-frame-by-name :wk "Select frame by name")
    "o o" '(reveal-in-osx-finder :wk "Reveal current folder in OSX Finder")
    )

  (gb/leader-keys
    "s" '(:ignore t :wk "Search")
    "s d" '(dictionary-search :wk "Search dictionary")
    "s m" '(man :wk "Man pages")
    "s t" '(tldr :wk "Lookup TLDR docs for a command")
    "s w" '(jinx-correct :wk "Jinx is a fast spell checker for emacs")
    "s b" '(consult-buffer :wk "switch buffer using consult")
    )

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
    "x" '(scratch-buffer :wk "Open the scratch buffer")
    "X" '(org-capture :wk "Start an org-capture")
    )

  )

(setq user-full-name "Gardner Berry"
    user-mail-address "gardner@gardnerberry.com")

;; (define-globalized-minor-mode global-rainbow-mode rainbow-mode
  ;; (lambda ()
    ;; (when (not (memq major-mode
                ;; (list 'org-agenda-mode)))
     ;; (rainbow-mode 1))))
;; (global-rainbow-mode 1 )

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
            ("https://blog.linuxmint.com/?feed=rss2" linux)
            ("https://archlinux.org/news/" linux)
            ("https://fedoramagazine.org/feed/" linux)
            ("https://endeavouros.com/news/" linux)
            ;; Boat Stuff
            ("https://buffalonickelblog.com/feed/" boat)
            ("https://mobius.world/feed/" boat)
            ("https://www.mvuglybetty.com/blog-feed.xml" Ugly-Betty boat)
             ;; Emacs
            ("http://xenodium.com/rss.xml" emacs)
            ("https://cmdln.org/post/" emacs)
            ("https://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" emacs)
            ("https://systemcrafters.net/rss/news.xml" emacs)
            ("https://sachachua.com/blog/feed/" emacs)
            ("https://rostre.bearblog.dev/feed/?type=rss" emacs)
            ("https://200ok.ch/atom.xml" emacs)
            ;; ("https://planet.emacslife.com/atom.xml" PlanetEmacsLife emacs)
            ("https://blog.tecosaur.com/tmio/rss.xml" emacs)
            ;; News
            ))
(defun toggle-elfeed-unread ()
  (interactive)
  (if (string-match-p "+unread" elfeed-search-filter)
      (setq elfeed-search-filter (replace-regexp-in-string "+unread" "-unread" elfeed-search-filter))
    (setq elfeed-search-filter (concat elfeed-search-filter " +unread")))
  (elfeed-search-update :force))

;; Keybinding example for `elfeed-search-mode-map`:
(define-key elfeed-search-mode-map (kbd "U") 'toggle-elfeed-unread)
    )

  (use-package elfeed-goodies
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
(setq package-install-upgrade-built-in t)

(cond ((eq system-type 'darwin)
  (use-package reveal-in-osx-finder)
  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier `meta
        mac-option-modifier `none
        )
))

(use-package yeetube
  )
(setq yeetube-player 'IINA)

(setq bookmark-default-file "~/.config/emacs/bookmarks")  ; Set the bookmark file
     (setq bookmark-save-flag 1)                         ; Save bookmarks after every change

(load "~/.config/emacs/eperiodic.el")

;; Expands to: (elpaca evil (use-package evil :demand t))
(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-integration t  ;; This is optional since it's already set to t by default.
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t
          evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
    (evil-mode))

(use-package evil-collection
  :after evil
  :config
  ;; Do not uncomment this unless you want to specify each and every mode
  ;; that evil-collection should works with.  The following line is here
  ;; for documentation purposes in case you need it.
  ;; (setq evil-collection-mode-list '(calendar dashboard dired ediff info magit ibuffer org-agenda))
  (add-to-list 'evil-collection-mode-list 'help) ;; evilify help mode
  (evil-collection-init))

(use-package evil-tutor)

;; Using RETURN to follow links in Org/Evil
;; Unmap keys in 'evil-maps if not done, (setq org-return-follows-link t) will not work
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
;; Setting RETURN key in org-mode to follow links
  (setq org-return-follows-link  t)

;; (use-package syncthing)

(setq auto-save-file-name-transforms
	    `((".*" ,(concat user-emacs-directory "auto-save/") t))) 
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups/")))))

(use-package transient)

;; Module: `me-org' -- Package: `org'
(with-eval-after-load 'org
  (setq org-directory "~/Documents/"
	;; Set where org agenda get todos from
	org-agenda-files '("~/Documents/agenda.org" "~/Documents/To-Research.org" "~/Documents/inbox.org" "~/Documents/notes.org" "~/Documents/books.org" "~/Documents/mobile.org")
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
(add-hook 'org-mode-hook (lambda () (global-display-line-numbers-mode -1)))

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
  )
(use-package ox-pandoc
  )
(use-package ox-gfm
  )
(use-package org-re-reveal
  )
;; (use-package ox-reveal
  ;; )
(use-package ox-epub
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
  :hook (org-mode . toc-org-mode)
  :hook (markdown-mode . toc-org-mode)
  )

(use-package org-modern
    :ensure t
    :custom
    ;; (org-modern-hide-stars nil)		; adds extra indentation
    ;; (org-modern-table nil)
    (org-modern-star '("◉" "●" "○" "◆" "●" "○" "◆"))
    (org-modern-list 
     '(;; (?- . "-")
       (?* . "•")
       (?+ . "✦")))
    :hook
    (org-mode . org-modern-mode)
    (org-agenda-finalize . org-modern-agenda))
        ;; 	org-modern-list '((?- . ?➤) (?+ . ?✦)) ; changes +/- symbols in item lists

(use-package org-modern-indent
  ;; :load-path "~/code/emacs/org-modern-indent/"
  ; or
  :ensure (org-modern-indent :type git :host github :repo "jdtsmith/org-modern-indent")
  :hook
  (org-mode . org-indent-mode)
  )

(use-package org-cliplink
  )

(use-package org-contrib
  )

(defun +org--insert-item (direction)
  (let ((context (org-element-lineage
                  (org-element-context)
                  '(table table-row headline inlinetask item plain-list)
                  t)))
    (pcase (org-element-type context)
      ;; Add a new list item (carrying over checkboxes if necessary)
      ((or `item `plain-list)
       (let ((orig-point (point)))
         ;; Position determines where org-insert-todo-heading and `org-insert-item'
         ;; insert the new list item.
         (if (eq direction 'above)
             (org-beginning-of-item)
           (end-of-line))
         (let* ((ctx-item? (eq 'item (org-element-type context)))
                (ctx-cb (org-element-property :contents-begin context))
                ;; Hack to handle edge case where the point is at the
                ;; beginning of the first item
                (beginning-of-list? (and (not ctx-item?)
                                         (= ctx-cb orig-point)))
                (item-context (if beginning-of-list?
                                  (org-element-context)
                                context))
                ;; Horrible hack to handle edge case where the
                ;; line of the bullet is empty
                (ictx-cb (org-element-property :contents-begin item-context))
                (empty? (and (eq direction 'below)
                             ;; in case contents-begin is nil, or contents-begin
                             ;; equals the position end of the line, the item is
                             ;; empty
                             (or (not ictx-cb)
                                 (= ictx-cb
                                    (1+ (point))))))
                (pre-insert-point (point)))
           ;; Insert dummy content, so that `org-insert-item'
           ;; inserts content below this item
           (when empty?
             (insert " "))
           (org-insert-item (org-element-property :checkbox context))
           ;; Remove dummy content
           (when empty?
             (delete-region pre-insert-point (1+ pre-insert-point))))))
      ;; Add a new table row
      ((or `table `table-row)
       (pcase direction
         ('below (save-excursion (org-table-insert-row t))
                 (org-table-next-row))
         ('above (save-excursion (org-shiftmetadown))
                 (+org/table-previous-row))))

      ;; Otherwise, add a new heading, carrying over any todo state, if
      ;; necessary.
      (_
       (let ((level (or (org-current-level) 1)))
         ;; I intentionally avoid `org-insert-heading' and the like because they
         ;; impose unpredictable whitespace rules depending on the cursor
         ;; position. It's simpler to express this command's responsibility at a
         ;; lower level than work around all the quirks in org's API.
         (pcase direction
           (`below
            (let (org-insert-heading-respect-content)
              (goto-char (line-end-position))
              (org-end-of-subtree)
              (insert "\n" (make-string level ?*) " ")))
           (`above
            (org-back-to-heading)
            (insert (make-string level ?*) " ")
            (save-excursion (insert "\n"))))
         (run-hooks 'org-insert-heading-hook)
         (when-let* ((todo-keyword (org-element-property :todo-keyword context))
                     (todo-type    (org-element-property :todo-type context)))
           (org-todo
            (cond ((eq todo-type 'done)
                   ;; Doesn't make sense to create more "DONE" headings
                   (car (+org-get-todo-keywords-for todo-keyword)))
                  (todo-keyword)
                  ('todo)))))))

    (when (org-invisible-p)
      (org-show-hidden-entry))
    (when (and (bound-and-true-p evil-local-mode)
               (not (evil-emacs-state-p)))
      (evil-insert 1))))

;;;###autoloa
(defun +org/insert-item-below (count)
  "Inserts a new heading, table cell or item below the current one."
  (interactive "p")
  (dotimes (_ count) (+org--insert-item 'below)))

;;;###autoload
(defun +org/insert-item-above (count)
  "Inserts a new heading, table cell or item above the current one."
  (interactive "p")
  (dotimes (_ count) (+org--insert-item 'above)))

(define-key org-mode-map (kbd "<C-return>") '+org/insert-item-below)

(defun my-org-todo-toggle ()
  (interactive)
  (let ((state (org-get-todo-state))
        post-command-hook)
    (if (string= state "TODO")
        (org-todo "DONE")
      (org-todo "TODO"))
    (run-hooks 'post-command-hook)
    (org-flag-subtree t)))

(define-key org-mode-map (kbd "C-c C-d") 'my-org-todo-toggle)

;; (with-eval-after-load 'org-mode 
  (defun gw/org-colors-doom-one ()
    "Enable Doom One Colors for Org headers."
    (interactive)
    (dolist
        (face
         '((org-level-1 1.7 "#ff6c6b" ultra-bold)
           (org-level-2 1.6 "#da8548" extra-bold)
           (org-level-3 1.5 "#ECBE7B" bold)
           (org-level-4 1.4 "#98be65" semi-bold)
           (org-level-5 1.3 "#51afef" normal)
           (org-level-6 1.2 "#2257A0" normal)
           (org-level-7 1.1 "#a9a1e1" normal)
           (org-level-8 1.0 "#c678dd" normal)))
      (set-face-attribute (nth 0 face) nil :font '"Atkinson Hyperlegible" :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
      (set-face-attribute 'org-table nil :font '"JetBrains Mono" :weight 'normal :height 1.0 :foreground "#bbc2cf"))
(add-hook 'emacs-startup-hook 'org-colors-doom-one)

(load "~/.config/doom/typing-practice.el")

(defadvice practice-typing (around no-cursor activate)
  "Do not show cursor at minibuffer during typing practice."
  (let ((minibuffer-setup-hook
         (cons (lambda () (setq cursor-type nil))
               minibuffer-setup-hook)))
    ad-do-it))

(use-package olivetti
  )
(setq olivetti-style 'fringes-and-margins)

(use-package palimpsest
  )
(add-hook 'text-mode-hook 'palimpsest-mode)

;; (map!
       ;; :leader
      ;; (:desc "Palimpsest-Send-Bottom" "n g" palimpsest-send-bottom))

;; Enable abbreviation mode
  (dolist (hook '(org-mode-hook
                    text-mode-hook))
      (add-hook hook #'abbrev-mode))
(quietly-read-abbrev-file "~/.config/emacs/abbrev_defs")

(use-package yasnippet
    )
  (setq yas-snippet-dirs '("~/Documents/emacs-stuff/snippets"))
(add-hook 'text-mode-hook (lambda () (yas-global-mode 1)))

(use-package git-timemachine
  :after git-timemachine
  :hook (evil-normalize-keymaps . git-timemachine-hook)
  :config
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision)
)

(use-package magit)
(use-package hl-todo)
(use-package magit-todos
    :after magit
    :after hl-todo
    :config (magit-todos-mode 1))

(use-package jinx
   :hook (emacs-startup . global-jinx-mode))

(use-package synosaurus
  )

(use-package denote)
  (setq denote-directory (expand-file-name "~/Notes")
        denote-known-keywords '("emacs" "history" "english" "school" "philosophy")
        denote-file-type 'org
        )
(add-hook 'dired-mode-hook #'denote-dired-mode)

(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

(add-hook 'pdf-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

(setq eshell-aliases-file "~/.config/doom/eshell/aliases")

;; (with-eval-after-load "esh-opt"
  ;; (autoload 'epe-theme-lambda "eshell-prompt-extras")
  ;; (setq eshell-highlight-prompt nil
        ;; eshell-prompt-function 'epe-theme-lambda))

;; (setq ellama-buffer-mode "org-mode")
(use-package ellama
  :init
  (setopt ellama-language "English")
  (setopt ellama-buffer-mode 'org-mode)
  (require 'llm-ollama)
  (setopt ellama-provider
                  (make-llm-ollama
                   :chat-model "zephyr:latest" :embedding-model "zephyr:latest"))
  ;; Predefined llm providers for interactive switching.
  ;; You shouldn't add ollama providers here - it can be selected interactively
  ;; without it. It is just example.
  (setopt ellama-providers
                  '(("zephyr" . (make-llm-ollama
                                                 :chat-model "zephyr:latest"
                                                 :embedding-model "zephyr:latest"))
                        ("mistral" . (make-llm-ollama
                                                  :chat-model "mistral:latest"
                                                  :embedding-model "mistral:latest"))
                        ("dolphin-mixtral" . (make-llm-ollama
                                                  :chat-model "dolphin-mixtral:latest"
                                                  :embedding-model "dolphin-mixtral:latest")))))

(use-package chatgpt-shell
  :config

  (setq chatgpt-shell-openai-key "placeholder")
  )

(use-package mastodon
  :config
  (setq mastodon-instance-url "https://social.linux.pizza"
      mastodon-active-user "Gamewarrior010")
  )

(use-package lem
  :config
(setq lem-instance-url "https://lemmy.world")
(setq lem-current-user "GameWarrior"))

(use-package dired-open
  :config
   (setq dired-open-extensions '(("gif" . "sxiv")
				 ("jpg" . "sxiv")
				 ("png" . "sxiv")
				 ("mkv" . "IINA")
				 ("mp4" . "IINA"))))

(use-package peep-dired
  :after dired
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
 )

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package diredfl
  :hook
  (dired-mode . diredfl-mode))

(setq dired-use-ls-dired t
 dired-listing-switches "-ahl --group-directories-first")

(cond ((eq system-type 'darwin)
       (setq insert-directory-program "/opt/homebrew/bin/gls"))
      )

(use-package nix-mode
  )

(use-package ob-nix
  )

(use-package nixpkgs-fmt
  )

(use-package yaml-mode)

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

(use-package lua-mode)

(use-package corfu
  :hook (emacs-startup . global-corfu-mode)
  :hook (eshell-mode . +corfu-less-intrusive-h)
  :hook (minibuffer-setup . +corfu-enable-in-minibuffer-h)
  :bind (:map corfu-map
	 ("M-m" . +corfu-complete-in-minibuffer)
	 ("<tab>" . corfu-next)
	 ("<backtab>" . corfu-previous)
	 ("C-j" . corfu-next)
	 ("C-k" . corfu-previous))
  :custom
  (corfu-auto t) ; Enable auto completion
  (corfu-cycle t) ; Allows cycling through candidates
  (corfu-min-width 25)
  (corfu-auto-delay 0.2)
  :config
  (defun +corfu-enable-in-minibuffer-h ()
    "Enable Corfu in the minibuffer if `completion-at-point' is bound."
    (when (where-is-internal #'completion-at-point (list (current-local-map)))
      (setq-local corfu-auto nil) ; Enable/disable auto completion
      (corfu-mode 1)))
)

  (use-package corfu-terminal
    :hook (corfu-mode . corfu-terminal-mode))

  (use-package nerd-icons-corfu
    :after corfu
    :demand t
    :config
    (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package consult
    :hook (embark-collect-mode . consult-preview-at-point-mode)
    :bind (:map minibuffer-local-map
	   ("C-r" . consult-history)
	   ("C-S-v" . consult-yank-pop)
	   :package isearch
	   :map isearch-mode-map
	   ("C-S-v" . consult-yank-pop)))
(use-package consult-dir
  :bind (("C-x C-d" . consult-dir)
         :package vertico
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package embark
    :bind (("<remap> <describe-bindings>" . embark-bindings)
	   ("C-²" . embark-act) ; In a French AZERTY keyboard, the ² key is right above TAB
	   ("M-²" . embark-collect)
	   ("C-&" . embark-dwim))
    :init
    ;; Use Embark to show bindings in a key prefix with `C-h`
    (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after embark consult
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package marginalia
  :hook (emacs-startup . marginalia-mode))

(use-package nerd-icons-completion
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup))

(use-package orderless
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
    :hook (emacs-startup . vertico-mode)
    ;; In the minibuffer, "C-k" is be mapped to act like "<up>". However, in
    ;; Emacs, "C-k" have a special meaning of `kill-line'. So lets map "C-S-k"
    ;; to serve the original "C-k".
    :bind (:map vertico-map
	   ("C-j" . vertico-next)
	   ("C-k" . vertico-previous)
	   :map minibuffer-local-map
	   ("C-S-k" . kill-line))
    :custom
    (vertico-cycle t)
    (vertico-resize nil)
    (vertico-count 12))

;; Persist history over Emacs restarts. Vertico sorts by history position.
;; (use-package savehist
  ;; :init
  ;; (savehist-mode))

(use-package which-key
  :init
    (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-allow-imprecise-window-fit nil
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit nil
	  which-key-separator " → " ))

(use-package xkcd)

(use-package 2048-game
  :elpaca (2048-game :type git :host github :repo "https://github.com/emacsmirror/2048-game.git")
  )

(use-package vterm)
(use-package vterm-toggle)

(use-package multi-vterm
	:config
	(add-hook 'vterm-mode-hook
			(lambda ()
			(setq-local evil-insert-state-cursor 'box)
			(evil-insert-state))))

(use-package casual)
