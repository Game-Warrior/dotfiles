(beacon-mode 1)

(setq user-full-name "Gardner Berry"
    user-mail-address "gardner@gamewarrior.xyz")

(setq frame-title-format "Hey bro, just FYI, this buffer is called %b or something like that.")

(setq doom-theme 'doom-one)
(map! :leader
      :desc "Load new theme" "h t" #'load-theme)

(setq browse-url-browser-function 'browse-url-default-browser)

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
  (kbd "T") 'dired-do-touch
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
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(straight-use-package 'dirvish)
(dirvish-override-dired-mode)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq doom-font (font-spec :family "JetBrains Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

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

(setq ivy-posframe-display-functions-alist
      '((swiper                     . ivy-posframe-display-at-point)
        (complete-symbol            . ivy-posframe-display-at-point)
        (counsel-M-x                . ivy-display-function-fallback)
        (counsel-esh-history        . ivy-posframe-display-at-window-center)
        (counsel-describe-function  . ivy-display-function-fallback)
        (counsel-describe-variable  . ivy-display-function-fallback)
        (counsel-find-file          . ivy-display-function-fallback)
        (counsel-recentf            . ivy-display-function-fallback)
        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
        (dmenu                      . ivy-posframe-display-at-frame-top-center)
        (nil                        . ivy-posframe-display))
      ivy-posframe-height-alist
      '((swiper . 20)
        (dmenu . 20)
        (t . 10)))
(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

(map! :leader
      (:prefix ("v" . "Ivy")
       :desc "Ivy push view" "v p" #'ivy-push-view
       :desc "Ivy switch view" "v s" #'ivy-switch-view))

(setq display-line-numbers-type t)
(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers" "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-18")
(setq doom-modeline-height 50     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name
;; Count words
(setq doom-modeline-enable-word-count '(markdow-mode gfm-mode org-mode))

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/Documents/"
        org-agenda-files '("~/Documents/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
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
             "BLOG(b)"           ; Blog writing assignments
             "SCHOOL(s)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

(after! org
(defun gw/org-colors-doom-one ()
  "Enable Doom One colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#51afef" ultra-bold)
         (org-level-2 1.6 "#c678dd" extra-bold)
         (org-level-3 1.5 "#98be65" bold)
         (org-level-4 1.4 "#da8548" semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-dracula ()
  "Enable Dracula colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#8be9fd" ultra-bold)
         (org-level-2 1.6 "#bd93f9" extra-bold)
         (org-level-3 1.5 "#50fa7b" bold)
         (org-level-4 1.4 "#ff79c6" semi-bold)
         (org-level-5 1.3 "#9aedfe" normal)
         (org-level-6 1.2 "#caa9fa" normal)
         (org-level-7 1.1 "#5af78e" normal)
         (org-level-8 1.0 "#ff92d0" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-gruvbox-dark ()
  "Enable Gruvbox Dark colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#fb4934" ultra-bold)
         (org-level-2 1.6 "#d79921" extra-bold)
         (org-level-3 1.5 "#8ec07c" bold)
         (org-level-4 1.4 "#98971a" semi-bold)
         (org-level-5 1.3 "#83a598" normal)
         (org-level-6 1.2 "#458588" normal)
         (org-level-7 1.1 "#d3869b" normal)
         (org-level-8 1.0 "#b16286" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-monokai-pro ()
  "Enable Monokai Pro colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#78dce8" ultra-bold)
         (org-level-2 1.6 "#ab9df2" extra-bold)
         (org-level-3 1.5 "#a9dc76" bold)
         (org-level-4 1.4 "#fc9867" semi-bold)
         (org-level-5 1.3 "#ff6188" normal)
         (org-level-6 1.2 "#ffd866" normal)
         (org-level-7 1.1 "#78dce8" normal)
         (org-level-8 1.0 "#ab9df2" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-nord ()
  "Enable Nord colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#81a1c1" ultra-bold)
         (org-level-2 1.6 "#b48ead" extra-bold)
         (org-level-3 1.5 "#a3be8c" bold)
         (org-level-4 1.4 "#ebcb8b" semi-bold)
         (org-level-5 1.3 "#bf616a" normal)
         (org-level-6 1.2 "#88c0d0" normal)
         (org-level-7 1.1 "#81a1c1" normal)
         (org-level-8 1.0 "#b48ead" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-oceanic-next ()
  "Enable Oceanic Next colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#EC5f67" ultra-bold)
         (org-level-2 1.6 "#99C794" extra-bold)
         (org-level-3 1.5 "#F99157" bold)
         (org-level-4 1.4 "#fac863" semi-bold)
         (org-level-5 1.3 "#5fb3b3" normal)
         (org-level-6 1.2 "#ec5f67" normal)
         (org-level-7 1.1 "#6699cc" normal)
         (org-level-8 1.0 "#c594c5" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-palenight ()
  "Enable Palenight colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#82aaff" ultra-bold)
         (org-level-2 1.6 "#c792ea" extra-bold)
         (org-level-3 1.5 "#c3e88d" bold)
         (org-level-4 1.4 "#ffcb6b" semi-bold)
         (org-level-5 1.3 "#a3f7ff" normal)
         (org-level-6 1.2 "#e1acff" normal)
         (org-level-7 1.1 "#f07178" normal)
         (org-level-8 1.0 "#ddffa7" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-solarized-dark ()
  "Enable Solarized Dark colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#dc322f" ultra-bold)
         (org-level-2 1.6 "#859900" extra-bold)
         (org-level-3 1.5 "#cb4b16" bold)
         (org-level-4 1.4 "#2aa198" semi-bold)
         (org-level-5 1.3 "#b58900" normal)
         (org-level-6 1.2 "#6c71c4;" normal)
         (org-level-7 1.1 "#d33682" normal)
         (org-level-8 1.0 "#859900" normal)))

    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-solarized-light ()
  "Enable Solarized Light colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#dc322f" ultra-bold)
         (org-level-2 1.6 "#b58900" extra-bold)
         (org-level-3 1.5 "#cb4b16" bold)
         (org-level-4 1.4 "#2aa198" semi-bold)
         (org-level-5 1.3 "#268bd2" normal)
         (org-level-6 1.2 "#6c71c4" normal)
         (org-level-7 1.1 "#657b83" normal)
         (org-level-8 1.0 "#859900" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-tomorrow-night ()
  "Enable Tomorrow Night colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#81a2be" ultra-bold)
         (org-level-2 1.6 "#b294bb" extra-bold)
         (org-level-3 1.5 "#b5bd68" bold)
         (org-level-4 1.4 "#e6c547" semi-bold)
         (org-level-5 1.3 "#cc6666" normal)
         (org-level-6 1.2 "#70c0ba" normal)
         (org-level-7 1.1 "#b77ee0" normal)
         (org-level-8 1.0 "#9ec400" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-henna ()
  "Enable Henna colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#e74c3c" ultra-bold)
         (org-level-2 1.6 "#1abc9c" extra-bold)
         (org-level-3 1.5 "#53df83" bold)
         (org-level-4 1.4 "#ff6655" semi-bold)
         (org-level-5 1.3 "#99bb66" normal)
         (org-level-6 1.2 "#56b6c2" normal)
         (org-level-7 1.1 "#51afef" normal)
         (org-level-8 1.0 "#ff6655" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

(defun gw/org-colors-doom-one-alt ()
  "Enable an alternitive set of Doom One colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#ff6c6b" ultra-bold)
         (org-level-2 1.6 "#da8548" extra-bold)
         (org-level-3 1.5 "#a9a1e1" bold)
         (org-level-4 1.4 "#51afef " semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#98be65" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun gw/org-colors-doom-old-hope ()
  "Enable Doom Old Hope colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#4fb3d8" ultra-bold)
         (org-level-2 1.6 "#ee7b29" extra-bold)
         (org-level-3 1.5 "#78bd65" bold)
         (org-level-4 1.4 "#b978ab" semi-bold)
         (org-level-5 1.3 "#4fb3d8" normal)
         (org-level-6 1.2 "#ee7b29" normal)
         (org-level-7 1.1 "#78bd65" normal)
         (org-level-8 1.0 "#b978ab" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

(defun gw/org-colors-peacock ()
  "Enable Doom Peacock colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#4fb3d8" ultra-bold)
         (org-level-2 1.6 "#ee7b29" extra-bold)
         (org-level-3 1.5 "#78bd65" bold)
         (org-level-4 1.4 "#b978ab" semi-bold)
         (org-level-5 1.3 "#4fb3d8" normal)
         (org-level-6 1.2 "#ee7b29" normal)
         (org-level-7 1.1 "#78bd65" normal)
         (org-level-8 1.0 "#b978ab" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))
;; Load our desired gw/org-colors-* theme on startup
    (gw/org-colors-doom-one-alt))
;; )

(use-package! ox-twbs)
(use-package! ox-re-reveal)
(use-package! ox-pandoc)

(setq org-journal-dir "~/Documents/Personal/journal/"
      org-journal-date-prefix "* "
      org-journal-time-prefix "** "
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%Y-%m-%d.org")

(require 'org-gcal)
(setq org-gcal-client-id "your-id-foo.apps.googleusercontent.com"
      org-gcal-client-secret "your-secret"
      org-gcal-file-alist '(("berrygw06@gmail.com" .  "~/Documents/schedule.org")))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package org-roam
:ensure t
:init
(setq org-roam-v2-ack t)
:custom
(org-roam-directory "~/Notes")
(org-roam-completion-everywhere t)
:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point))
:config
(org-roam-setup))

(use-package hide-mode-line)

(defun efs/presentation-setup ()
  ;; Hide the mode line
  (hide-mode-line-mode 1)

  ;; Display images inline
  (org-display-inline-images) ;; Can also use org-startup-with-inline-images

  ;; Scale the text.  The next line is for basic scaling:
  (setq text-scale-mode-amount 3)
  (text-scale-mode 1))

  ;; This option is more advanced, allows you to scale other faces too
  ;; (setq-local face-remapping-alist '((default (:height 2.0) variable-pitch)
  ;;                                    (org-verbatim (:height 1.75) org-verbatim)
  ;;                                    (org-block (:height 1.25) org-block))))

(defun efs/presentation-end ()
  ;; Show the mode line again
  (hide-mode-line-mode 0)

  ;; Turn off text scale mode (or use the next line if you didn't use text-scale-mode)
  ;; (text-scale-mode 0))

  ;; If you use face-remapping-alist, this clears the scaling:
  (setq-local face-remapping-alist '((default variable-pitch default))))

(use-package org-tree-slide
  :hook ((org-tree-slide-play . efs/presentation-setup)
         (org-tree-slide-stop . efs/presentation-end))
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " > ")
  (org-image-actual-width nil))

;; Reveal.js + Org mode
(require 'ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-plugins t)
(setq org-re-reveal-title-slide "<h1>%t</h1><h2>%a</h2><h3>@Gamewarrior@mastodon.world</h3>")

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(global-set-key (kbd "M-b") 'ace-window)

(setq yas-snippet-dirs '("~/Documents/emacs-stuff/snippets"))
(yas-global-mode 1)

;;This is where I will change the keybindings to Palemcest-mode if I remember.

(add-to-list 'auto-mode-alist '("\\.html\\'" .web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq mastodon-instance-url "https://social.linux.pizza"
      mastodon-active-user "Gamewarrior010")

;; Enable abbreviation mode
(abbrev-mode 1)

(setq openai-api-key "example")
(require 'request)

(defgroup aide nil
  "aide.el custom settings"
  :group 'external
  :prefix "aide-")

(defcustom aide-max-tokens 100
  "The max-tokens paramater that aide.el sends to OpenAI API."
  :type 'integer
  :group 'aide)

(defcustom aide-temperature 0
  "The temperature paramater that aide.el sends to OpenAI API."
  :type 'float
  :group 'aide)

(defcustom aide-top-p 0.1
  "The top-p paramater that aide.el sends to OpenAI API."
  :type 'float
  :group 'aide)

(defcustom aide-frequency-penalty 0
  "The frequency_penalty paramater that aide.el sends to OpenAI API."
  :type 'float
  :group 'aide)

(defcustom aide-presence-penalty 0
  "The presence_penalty paramater that aide.el sends to OpenAI API."
  :type 'float
  :group 'aide)

(defcustom aide-completions-model "davinci"
  "Name of the model used for completions. aide sends requests to
the OpenAI API endpoint of this model."
  :type 'string
  :group 'aide
  :options '("davinci", "text-davinci-002", "text-curie-001", "text-babbage-001", "text-ada-001"))

(defun aide-openai-complete (api-key prompt)
  "Return the prompt answer from OpenAI API.
API-KEY is the OpenAI API key.

PROMPT is the prompt string we send to the API."
  (let ((result nil)
        (auth-value (format "Bearer %s" api-key)))
    (request
      (format "https://api.openai.com/v1/engines/%s/completions" aide-completions-model)
      :type "POST"
      :data (json-encode `(("prompt" . ,prompt)
                           ("max_tokens" . ,aide-max-tokens)
                           ("temperature" . ,aide-temperature)
                           ("frequency_penalty" . ,aide-frequency-penalty)
                           ("presence_penalty" . ,aide-presence-penalty)
                           ("top_p" . ,aide-top-p)))
      :headers `(("Authorization" . ,auth-value) ("Content-Type" . "application/json"))
      :sync t
      :parser 'json-read
      :success (cl-function
                (lambda (&key data &allow-other-keys)
                  (setq result (alist-get 'text (elt (alist-get 'choices data) 0))))))
    result))

(defun aide-openai-complete-region (start end)
  "Send the region to OpenAI autocomplete engine and get the result.

START and END are selected region boundaries."
  (interactive "r")
  (let* ((region (buffer-substring-no-properties start end))
         (result (aide--openai-complete-string region)))
    (message "%s" result)))

(defun aide-openai-complete-region-insert (start end)
  "Send the region to OpenAI and insert the result to the end of buffer.

START and END are selected region boundaries."
  (interactive "r")
  (let* ((region (buffer-substring-no-properties start end))
         (result (aide--openai-complete-string region))
        original-point)
    (goto-char (point-max))
    (setq original-point (point))
    (if result
        (progn
          (insert "\n" result)
          (fill-paragraph)
          (let ((x (make-overlay original-point (point-max))))
            (overlay-put x 'face '(:foreground "orange red")))
          result)
      (message "Empty result"))))

(defun aide-openai-complete-buffer-insert ()
  "Send the ENTIRE buffer to OpenAI and insert the result to the end of buffer."
  (interactive)
  (let (region
        result
        original-point)
    (setq region (buffer-substring-no-properties (point-min) (point-max)))
    (setq result (aide--openai-complete-string region))
    (goto-char (point-max))
    (setq original-point (point))
    (if result
        (progn
          (insert "\n" result)
          (fill-paragraph)
          (let ((x (make-overlay original-point (point-max))))
            (overlay-put x 'face '(:foreground "orange red")))
          result)
      (message "Empty result"))))

(defun aide-openai-tldr-region (start end)
  "Send the region to OpenAI autocomplete engine and get the TLDR result.

START and END are selected region boundaries."
  (interactive "r")
  (let* ((region (buffer-substring-no-properties start end))
         (result (aide--openai-complete-string (concat region "\n\n tl;dr:"))))
    (message "%s" result)))

(defun aide-openai-edits (api-key instruction input)
  "Return the edits answer from OpenAI API.
API-KEY is the OpenAI API key.

INSTRUCTION and INPUT are the two params we send to the API."
  (let ((result nil)
        (auth-value (format "Bearer %s" api-key)))
    (request
      "https://api.openai.com/v1/engines/text-davinci-edit-001/edits"
      :type "POST"
      :data (json-encode `(("input" . ,input)
                           ("instruction" . ,instruction)
                           ("temperature" . 0.9)))
      :headers `(("Authorization" . ,auth-value)
                 ("Content-Type" . "application/json"))
      :sync t
      :parser 'json-read
      :success (cl-function
                (lambda (&key data &allow-other-keys)
                  (setq result (alist-get 'text (elt (alist-get 'choices data) 0))))))
    result))

(defun aide-openai-edits-region-insert (start end)
  "Send the region to OpenAI edits and insert the result to the end of region.

START and END are selected region boundaries."
  (interactive "r")
  (let* ((region (buffer-substring-no-properties start end))
         (result (aide-openai-edits openai-api-key "Rephrase the text" region)))
    (goto-char end)
    (if result
        (progn
          (insert "\n" result)
          (fill-paragraph)
          (let ((x (make-overlay end (point))))
            (overlay-put x 'face '(:foreground "orange red")))
          result)
      (message "Empty result"))))

(defun aide-openai-edits-region-replace (start end)
  "Send the region to OpenAI edits and replace the region.

START and END are selected region boundaries.

The original content will be stored in the kill ring."
  (interactive "r")
  (let* ((region (buffer-substring-no-properties start end))
         (result (aide-openai-edits openai-api-key "Rephrase the text" region)))
    (goto-char end)
    (if result
        (progn
          (kill-region start end)
          (insert "\n" result)
          (fill-paragraph)
          (let ((x (make-overlay end (point))))
            (overlay-put x 'face '(:foreground "orange red")))
          result)
      (message "Empty result"))))

;; private

(defun aide--openai-complete-string (string)
  (aide-openai-complete openai-api-key string))

(provide 'aide)
;;; aide.el ends here
