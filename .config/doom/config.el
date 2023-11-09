;;    _____ __          __
;;  / ____| \ \        / / GameWarrior
;; | |  __   \ \  /\  / /  https://github.com/game-warrior
;; | | |_ |   \ \/  \/ /   @gamewarrior010@social.linux.pizza
;; | |__| |    \  /\  /    https://www.gnu.org/software/emacs/
;;  \_____|     \/  \/     https://:github.com/doomemacs/doomemacs

(setq browse-url-browser-function 'browse-url-default-browser)

(setq doom-theme 'doom-palenight)
(map! :leader
      :desc "Load new theme" "h t" #'load-theme)

    (setq frame-title-format "Hey bro, just FYI, this buffer is called %b or something like that.")

(beacon-mode 1)

(setq doom-font (font-spec :family "JuliaMono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "JuliaMono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t))

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-18")
(setq doom-modeline-height 25     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-major-mode-icon t  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-enable-word-count '(markdown-mode gfm-mode org-mode fountain-mode) ;; Show word count
      )

(defun gw/insert-todays-date (prefix)
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%A, %B %d, %Y")
                 ((equal prefix '(4)) "%m-%d-%Y")
                 ((equal prefix '(16)) "%Y-%m-%d"))))
    (insert (format-time-string format))))

(require 'calendar)
(defun gw/insert-any-date (date)
  "Insert DATE using the current locale."
  (interactive (list (calendar-read-date)))
  (insert (calendar-date-string date)))

(map! :leader
      (:prefix ("i d" . "Insert date")
        :desc "Insert any date" "a" #'gw/insert-any-date
        :desc "Insert todays date" "t" #'gw/insert-todays-date))

(map! :after ibuffer
      :map ibuffer-mode-map
      :n "l" #'ibuffer-visit-buffer
      :n "h" #'kill-current-buffer)

(assoc-delete-all "Open project" +doom-dashboard-menu-sections)
(assoc-delete-all "Recently opened files" +doom-dashboard-menu-sections)
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(cond ((eq system-type 'darwin)
       (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by the  walled garden!"))))
      ((eq system-type 'gnu/linux)
        (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered bye 󰆚 Oxen and 󰻀 Penguins!"))))
      ((eq system-type 'windows-nt)
       (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Proprietary Garbage!")))))

;; (defun gw/doom-art1 ()
  ;; (let* ((banner'("______ _____ ____ ___ ___"
                  ;; "`  _  V  _  V  _ \\|  V  ´"
                  ;; "| | | | | | | | | |     |"
                  ;; "| | | | | | | | | | . . |"
                  ;; "| |/ / \\ \\| | |/ /\\ |V| |"
                  ;; "|   /   \\__/ \\__/  \\| | |"
                  ;; "|  /                ' | |"
                  ;; "| /     E M A C S     \\ |"
                  ;; "´´                     ``"))
         ;; (longest-line (apply #'max (mapcar #'length banner))))
    ;; (put-text-property
     ;; (point)
     ;; (dolist (line banner (point))
       ;; (insert (+doom-dashboard--center
                ;; +doom-dashboard--width
                ;; (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               ;; "\n"))
     ;; 'face 'doom-dashboard-banner)))

;; (setq +doom-dashboard-ascii-banner-fn #'gw/doom-art1)
(setq fancy-splash-image (concat doom-private-dir "images/doom-emacs-dash.png"))

(add-hook 'doom-after-init-hook (lambda ()
                                  (tool-bar-mode 1)
                                  (tool-bar-mode 0)))
;; (add-hook 'doom-after-init-hook (lambda ()
                                  ;; (menu-bar-mode 1)
                                  ;; (menu-bar-mode 0)))
;; (setq menu-bar-mode -1)
;; (define-key global-map [menu-bar options] nil)
;; (define-key global-map [menu-bar file] nil)
;; (define-key global-map [menu-bar File] nil)
;; (define-key global-map [menu-bar edit] nil)
;; (define-key global-map [menu-bar tools] nil)
;; (define-key global-map [menu-bar buffer] nil)
;; (define-key global-map [menu-bar help-menu] nil)
;; (define-key global-map [menu-bar Table] nil)
;; (define-key global-map [menu-bar Org] nil)
;; (define-key global-map [menu-bar Text] nil)
;; (define-key global-map [menu-bar Jinx] nil)

(setq user-full-name "Gardner Berry"
    user-mail-address "gardner@gardnerberry.com")

;; (use-package emojify
  ;; :hook (after-init . global-emojify-mode))

;;(add-hook org-mode
;;(setq display-line-numbers-type nil)
;;)
(setq display-line-numbers-type 1)
(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers" "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(map!
 :leader
 (:desc "Open Xwidgets URL" "y" #'xwidget-webkit-browse-url))

(use-package elfeed-goodies
  :init
  (elfeed-goodies/setup)
  :config
  (setq elfeed-goodies/entry-pane-size 0.5))

(add-hook 'elfeed-show-mode-hook 'visual-line-mode)
(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)

(setq elfeed-feeds (quote
                     (
                     ;; General
                     ("https://frame.work/blog.rss" Framework)
                     ;; Linux
                     ("https://blog.linuxmint.com/?feed=rss2" linux LinuxMint)
                     ("https://archlinux.org/news/" linux Arch)
                     ("https://fedoramagazine.org/feed/" linux Fedora)
                     ("https://endeavouros.com/news/" linux EndeavourOS)
                     ;; Boat Stuff
                     ("https://buffalonickelblog.com/feed/" Buffalo-Nickle boat)
                     ("https://mobius.world/feed/" Mobius boat)
                     ;; Emacs
                     ("http://xenodium.com/rss.xml" emacs Xenodium)
                     ("https://cmdln.org/post/" emacs Commandline)
                     ("https://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" Karal-Voit emacs)
                     ("https://systemcrafters.net/rss/news.xml" emacs SystemCrafter)
                     ("https://sachachua.com/blog/feed/" emacs SachaChua)
                     )))

(after! projectile (setq projectile-project-root-files-bottom-up (remove ".git"
projectile-project-root-files-bottom-up))
  (lambda ()
    (projectile-add-known-project "~/Documents")
    (projectile-add-known-project "~/Developer/Projects/blog")
    ;; (projectile-add-known-project "~/Developer/Projects/")
  ))

(map! :leader
      (:prefix ("=" . "open file")
       :desc "Edit agenda file" "a" #'(lambda () (interactive) (find-file "~/Documents/agenda.org"))
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.config/doom/config.org"))
       :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.config/doom/init.el"))
       :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.config/doom/packages.el"))))
(map! :leader
      (:prefix ("= e" . "open eshell files")
       :desc "Edit eshell aliases" "a" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/aliases"))
       :desc "Edit eshell profile" "p" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/profile"))))

(load "~/.config/doom/typing-practice.el")

(defadvice practice-typing (around no-cursor activate)
  "Do not show cursor at minibuffer during typing practice."
  (let ((minibuffer-setup-hook
         (cons (lambda () (setq cursor-type nil))
               minibuffer-setup-hook)))
    ad-do-it))

(map!
 :leader
 (:desc "List Synonyms for word at point" "t n" #'synosaurus-choose-and-insert))

(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(add-hook 'text-mode-hook 'writegood-mode)

(setq gw/weasel-words
      '("actually"
        "basically"
        "easily"
        "easy"
        "simple"
        "simply"))
;; (setq writegood-weasel-words
      ;; (-concat writegood-weasel-words gw/weasel-words))
;; (map!
        ;; :leader
        ;; (:desc ""))

(setq +zen-text-scale 0.8)

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(map! :leader
      (:desc "Check Word" "s w" #'jinx-correct))

(setq olivetti-style 'fringes-and-margins)

(add-hook 'text-mode-hook 'palimpsest-mode)

;; (map!
       ;; :leader
      ;; (:desc "Palimpsest-Send-Bottom" "n g" palimpsest-send-bottom))

;; (require 'flycheck-vale)
;; (flycheck-vale-setup)
(flycheck-mode -1)

;; Enable abbreviation mode
  (dolist (hook '(org-mode-hook
                    text-mode-hook))
      (add-hook hook #'abbrev-mode))

(use-package blamer
  :bind (("s-i" . blamer-show-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 140
                    :italic t))))
  ;; :config
  ;; (global-blamer-mode 1))

(map! :leader
      (:desc "Open Magit" "g m" #'magit))

(setq yas-snippet-dirs '("~/Documents/emacs-stuff/snippets"))
(yas-global-mode 1)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-create-empty-file
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; File Icons in Dired
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "Preview")
                              ("jpg" . "Preview")
                              ("png" . "Preview")
                              ("mkv" . "IINA")
                              ("mp4" . "IINA")))

;; for sending mails
(require 'smtpmail)

;; we installed this with homebrew
(setq mu4e-mu-binary (executable-find "mu"))

;; this is the directory we created before:
(setq mu4e-maildir "~/.maildir")

;; this command is called to sync imap servers:
(setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))

;; how often to call it in seconds:
(setq mu4e-update-interval 300)

;; save attachment to desktop by default
;; or another choice of yours:
(setq mu4e-attachment-dir "~/Desktop")

;; rename files when moving - needed for mbsync:
(setq mu4e-change-filenames-when-moving t)

;; list of your email adresses:
(setq mu4e-user-mail-address-list '("berrygw06@gmail.com"))

;; gpg encryptiom & decryption:

;; this can be left alone

(require 'epa-file)

(epa-file-enable)

(setq epa-pinentry-mode 'loopback)

(auth-source-forget-all-cached)

;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)

;; send function:
(setq send-mail-function 'sendmail-send-it
      message-send-mail-function 'sendmail-send-it)

;; send program:
;; this is exeranal. remember we installed it before.
(setq sendmail-program (executable-find "msmtp"))

;; select the right sender email from the context.
(setq message-sendmail-envelope-from 'header)

;; chose from account before sending
;; this is a custom function that works for me.
;; well I stole it somewhere long ago.
;; I suggest using it to make matters easy
;; of course adjust the email adresses and account descriptions
(defun timu/set-msmtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                     (message-narrow-to-headers)
                     (message-fetch-field "from")))
             (account
              (cond
               ((string-match "berrygw06@gmail.com" from) "personal"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(add-hook 'message-send-mail-hook 'timu/set-msmtp-account)

;; mu4e cc & bcc
;; this is custom as well
(add-hook 'mu4e-compose-mode-hook
          (defun timu/add-cc-and-bcc ()
            "My Function to automatically add Cc & Bcc: headers.
    This is in the mu4e compose mode."
            (save-excursion (message-add-header "Cc:\n"))
            (save-excursion (message-add-header "Bcc:\n"))))

;; mu4e address completion
(add-hook 'mu4e-compose-mode-hook 'company-mode)

;; store link to message if in header view, not to header query:
(setq org-mu4e-link-query-in-headers-mode nil)

;; don't have to confirm when quitting:
(setq mu4e-confirm-quit nil)

;; number of visible headers in horizontal split view:
(setq mu4e-headers-visible-lines 20)

;; don't show threading by default:
(setq mu4e-headers-show-threads nil)

;; hide annoying "mu4e Retrieving mail..." msg in mini buffer:
(setq mu4e-hide-index-messages t)

;; customize the reply-quote-string:
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M :\n")

;; M-x find-function RET message-citation-line-format for docs:
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; by default do not show related emails:
(setq mu4e-headers-include-related nil)

;; by default do not show threads:
(setq mu4e-headers-show-threads nil)

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/Documents/"
        org-agenda-files '("~/Documents/agenda.org" "~/Documents/To-Research.org" "~/Documents/inbox.org" "~/Documents/notes.org" "~/Documents/books.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-archive-location "~/Documents/archive.org::"
        org-ellipsis " ↴ "
        ;; org-ellipsis" ⤷ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?- . ?➤) (?+ . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
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

(map! :leader
      (:desc "Archive Org-Todos" "v" org-archive-default-command))

(after! org
  (setq org-agenda-deadline-leaders '("" "" "%2d d. ago: ")
      org-deadline-warning-days 0
      org-agenda-span 7
      org-agenda-start-day "-0d"
      org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done)
      org-log-done 'time
      )
)

(after! org-capture
  (setq org-capture-templates
        '(("t" "todo" entry (file+headline "~/Documents/agenda.org")
           "* TODO %?\n  %i\n  %a")
          ("T" "todo today" entry (file+headline "~/Documents/agenda.org")
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

(use-package! ox-twbs)
(use-package! ox-pandoc)
(use-package! ox-gfm)
(use-package! ox-re-reveal)
(use-package! ox-epub)
;; Make it so that org-export wont use numbered headings
(setq org-export-with-section-numbers nil)

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

(setq org-journal-dir "~/Documents/Personal/Journal/"
      org-journal-date-prefix "* "
      org-journal-time-prefix "** "
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%Y-%m-%d.org")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(defun gw/writing ()
  "Toggle between writing environment modes."
  (interactive)
  (if olivetti-mode
      (progn
        (olivetti-mode -1)
        (doom-big-font-mode -1))
    (progn
      (olivetti-mode)
      (doom-big-font-mode))))

(load "~/.config/doom/org-novelist.el")
    (setq org-novelist-language-tag "en-US"  ; The interface language for Org Novelist to use. It defaults to 'en-GB' when not set
          org-novelist-author "Gardner Berry")  ; The default author name to use when exporting a story. Each story can also override this setting
          ;; org-novelist-author-email "gardner@gamewarrior.xyz"  ; The default author contact email to use when exporting a story. Each story can also override this setting
          ;; org-novelist-automatic-referencing-p nil)  ; Set this variable to 't' if you want Org Novelist to always keep note links up to date. This may slow down some systems when operating on complex stories. It defaults to 'nil' when not set

(require 'org-tempo)

(setq mastodon-instance-url "https://social.linux.pizza"
      mastodon-active-user "Gamewarrior010")

(setq lem-instance-url "https://discuss.online")
(setq lem-current-user "GameWarrior")

(setq eshell-aliases-file "~/.config/doom/eshell/aliases")

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

;; (setq ellama-buffer-mode "org-mode")
(setopt ellama-language "English")

(setq chatgpt-shell-openai-key "placeholder")

(setq dall-e-shell-openai-key "placeholder")
