(beacon-mode 1)

(setq user-full-name "Gardner Berry"
    user-mail-address "gardner@gamewarrior.xyz")

(setq frame-title-format "Hey bro, just FYI, this buffer is called %b or something like that.")

(setq doom-theme 'doom-solarized-dark)
(map! :leader
      :desc "Load new theme" "h t" #'load-theme)

(setq browse-url-browser-function 'browse-url-default-browser)

(menu-bar-mode -1)

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dirvish-view-file)))

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
(setq dired-open-extensions '(("gif" . "Preview")
                              ("jpg" . "Preview")
                              ("png" . "Preview")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(assoc-delete-all "Open project" +doom-dashboard-menu-sections)
(assoc-delete-all "Recently opened files" +doom-dashboard-menu-sections)

;; (add-hook! '+doom-dashboard-functions :append
  ;; (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Emacs!")))

(cond ((eq system-type 'darwin)
       (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by the walled garden!"))))
      ((eq system-type 'gnu/linux)
        (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Oxen and Penguins!"))))
      ((eq system-type 'windows-nt)
       (add-hook! '+doom-dashboard-functions :append
         (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Proprietary Garbage!")))))

(defun gw/doom-art ()
  (let* ((banner'("______ _____ ____ ___ ___"
                  "`  _  V  _  V  _ \\|  V  ´"
                  "| | | | | | | | | |     |"
                  "| | | | | | | | | | . . |"
                  "| |/ / \\ \\| | |/ /\\ |V| |"
                  "|   /   \\__/ \\__/  \\| | |"
                  "|  /                ' | |"
                  "| /     E M A C S     \\ |"
                  "´´                     ``"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'gw/doom-art)

;; (use-package emojify
  ;; :hook (after-init . global-emojify-mode))

(setq doom-font (font-spec :family "SF Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "SF Mono" :size 24))
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
(setq doom-modeline-enable-word-count '(markdow-mode gfm-mode org-mode) )
(setq doom-modeline-lsp t)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/Documents/"
        org-agenda-files '("~/Documents/Schedule.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "✸" "✿" "◆" "○")
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
             "SCHOOL(s)"         ; School Tasks
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "CLASS(l)"          ; Agenda assignment for class
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
         (org-level-2 1.6 "#fe8019" extra-bold)
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
         (org-level-2 1.6 "#F99157" extra-bold)
         (org-level-3 1.5 "#fac863" bold)
         (org-level-4 1.4 "#99C794" semi-bold)
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
         (org-level-2 1.6 "#cb4b16" extra-bold)
         (org-level-3 1.5 "#b58900" bold)
         (org-level-4 1.4 "#859900" semi-bold)
         (org-level-5 1.3 "#35a69c" normal)
         (org-level-6 1.2 "#268bd2;" normal)
         (org-level-7 1.1 "#3F88AD" normal)
         (org-level-8 1.0 "#6c71c4" normal)))

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
         (org-level-2 1.6 "#56b5c2" extra-bold)
         (org-level-3 1.5 "#53df83" bold)
         (org-level-4 1.4 "#1abc9c" semi-bold)
         (org-level-5 1.3 "#ECBE7B" normal)
         (org-level-6 1.2 "#C5A3FF" normal)
         (org-level-7 1.1 "#FFB8D1" normal)
         (org-level-8 1.0 "" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#f8f8f0"))

(defun gw/org-colors-doom-one-alt ()
  "Enable an alternitive set of Doom One colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#ff6c6b" ultra-bold)
         (org-level-2 1.6 "#da8548" extra-bold)
         (org-level-3 1.5 "#46d9ff" bold)
         (org-level-4 1.4 "#98be65" semi-bold)
         (org-level-5 1.3 "#51afef" normal)
         (org-level-6 1.2 "#2257A0" normal)
         (org-level-7 1.1 "#c678dd" normal)
         (org-level-8 1.0 "#a9a1e1" normal)))
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
       '((org-level-1 1.7 "#ff5d38" ultra-bold)
         (org-level-2 1.6 "#cb4b16" extra-bold)
         (org-level-3 1.5 "#bcd42a" bold)
         (org-level-4 1.4 "#98be65" semi-bold)
         (org-level-5 1.3 "#4fb3d8" normal)
         (org-level-6 1.2 "#2257A0" normal)
         (org-level-7 1.1 "#c678dd" normal)
         (org-level-8 1.0 "#a9a1e1" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

(defun gw/org-colors-1337 ()
  "Enable Doom 1337 colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#FF5E5E" ultra-bold)
         (org-level-2 1.6 "#FC9354" extra-bold)
         (org-level-3 1.5 "#E9FDAC" bold)
         (org-level-4 1.4 "#B5CEA8" semi-bold)
         (org-level-5 1.3 "#468800" normal)
         (org-level-6 1.2 "#35CDAF" normal)
         (org-level-7 1.1 "#8CDAFF" normal)
         (org-level-8 1.0 "#C586C0" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

(defun gw/org-colors-oksolar-dark ()
  "Enable OKSolar Dark Colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#F23749" ultra-bold)
         (org-level-2 1.6 "#819500" extra-bold)
         (org-level-3 1.5 "#D56500" bold)
         (org-level-4 1.4 "#AC8300" semi-bold)
         (org-level-5 1.3 "#35A69C" normal)
         (org-level-6 1.2 "#2B90D8" normal)
         (org-level-7 1.1 "#3F88AD" normal)
         (org-level-8 1.0 "#DD459D" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

(defun gw/org-colors-spacegrey ()
  "Enable OKSolar Dark Colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#BF616A" ultra-bold)
         (org-level-2 1.6 "#D08770" extra-bold)
         (org-level-3 1.5 "#ECBE7B" bold)
         (org-level-4 1.4 "#A3BE8C" semi-bold)
         (org-level-5 1.3 "#4db5bd" normal)
         (org-level-6 1.2 "#2B90D8" normal)
         (org-level-7 1.1 "#2257A0" normal)
         (org-level-8 1.0 "#c678dd" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#cbccd1"))

;; Load our desired gw/org-colors-* theme on startup
    (gw/org-colors-solarized-dark))
;; )

;; (defun agenda-mark-done-and-archive ()
   ;; (interactive)
   ;; (org-agenda-todo 'done)
   ;; (org-agenda-archive))
 ;; (define-key org-agenda-mode-map "\C-c\C-x\C-s" 'agenda-mark-done-and-archive)

(use-package! ox-twbs)
;; (use-package! ox-re-reveal)
(use-package! ox-pandoc)
(use-package! ox-gfm)
(use-package! ox-reveal)

;; Reveal.js + Org mode
(require 'ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-plugins 1)
(setq org-reveal-title-slide "<h1>%t</h1><h2>%a</h2><h5>@Gamewarrior010@social.linux.pizza</h5>")
(setq org-reveal-theme "Moon")

     (defun set-ignored-headlines-tags (backend)
     "Remove all headlines with tag ignore_heading in the current buffer.
        BACKEND is the export back-end being used, as a symbol."
     (cond ((org-export-derived-backend-p backend 'md) (setq  org-export-exclude-tags '("noexport" "mdignore")))
           ((org-export-derived-backend-p backend 'reveal) (setq  org-export-exclude-tags '("noexport" "revealignore")))
           (t (setq  org-export-exclude-tags '("noexport")))
       )
    )

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

(defun gw/presentation-setup ()
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

(defun gw/presentation-end ()
  ;; Show the mode line again
  (hide-mode-line-mode 0)

  ;; Turn off text scale mode (or use the next line if you didn't use text-scale-mode)
  ;; (text-scale-mode 0))

  ;; If you use face-remapping-alist, this clears the scaling:
  (setq-local face-remapping-alist '((default variable-pitch default))))

(use-package org-tree-slide
  :hook ((org-tree-slide-play . gw/presentation-setup)
         (org-tree-slide-stop . gw/presentation-end))
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " > ")
  (org-image-actual-width nil))

(defun gw/writing-mode ()
  "Acctivate my writing environment"
  (interactive)
  (writeroom-mode 1)
  (abbrev-mode 1)
  (message "Get writing!"))

(defun gw/normal-writing ()
  "Deacctivate my writing environment"
  (interactive)
  (writeroom-mode 0)
  (message "You're done! Go touch some grass!"))

(use-package ivy-bibtex
  :init
  (setq bibtex-completion-bibliography '("~/Documents/emacs-stuff/bibliography/references.bib"
					 "~/Documents/emacs-stuff/bibliography/dei.bib"
					 "~/Documents/emacs-stuff/bibliography/main.bib"
					 "~/Documents/emacs-stuff/bibliography/archive.bib")
	bibtex-completion-library-path '("~/Documents/emacs-stuff/bibliography/bibtex-pdfs/")
	bibtex-completion-notes-path "~/Documents/emacs-stuff/bibliography/notes/"
	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

	bibtex-completion-additional-search-fields '(keywords)
	bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "open" nil 0 nil fpath))))

(use-package org-ref
  :ensure nil
  :init
  (require 'bibtex)
  (setq bibtex-autokey-year-length 4
	bibtex-autokey-name-year-separator "-"
	bibtex-autokey-year-title-separator "-"
	bibtex-autokey-titleword-separator "-"
	bibtex-autokey-titlewords 2
	bibtex-autokey-titlewords-stretch 1
	bibtex-autokey-titleword-length 5)
  (define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
  (define-key org-mode-map (kbd "s-[") 'org-ref-insert-link-hydra/body)
  (require 'org-ref-ivy)
  (require 'org-ref-arxiv)
  (require 'org-ref-scopus)
  (require 'org-ref-wos))


(use-package org-ref-ivy
  :ensure nil
  :init (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
	      org-ref-insert-cite-function 'org-ref-cite-insert-ivy
	      org-ref-insert-label-function 'org-ref-insert-label-link
	      org-ref-insert-ref-function 'org-ref-insert-ref-link
	      org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body))))

(require 'bibtex)

(setq bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-year-title-separator "-"
      bibtex-autokey-titleword-separator "-"
      bibtex-autokey-titlewords 2
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length 5)

(define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)

(setq global-hl-todo-mode 1)

(defun gw/todo-hl-oksolar-dark ()
  "Set TODO Colors to the OKSOLAR colors"
  (interactive)
 (setq hl-todo-keyword-faces
       '(("TODO"   . "#35A69C")
         ("FIXME"  . "#F23749")
         ("WAIT"   . "#7D80D1"))))
(defun gw/todo-hl-henna ()
  (interactive)
  (setq hl-todo-keyword-faces
        '(("TODO"  . "#1abc9c")
          ("FIXME" . "#e74c3c")
          ("WAIT"  . "#C5A3FF"))))

(gw/todo-hl-oksolar-dark)

(setq ispell-program-name "aspell")

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(global-set-key (kbd "M-b") 'ace-window)

(setq yas-snippet-dirs '("~/Documents/emacs-stuff/snippets"))
(yas-global-mode 1)

(add-hook 'text-mode-hook 'palimpsest-mode)

(add-to-list 'auto-mode-alist '("\\.html\\'" .web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; (require 'mastodon-alt)
;; (mastodon-alt-tl-activate)
    (setq mastodon-instance-url "https://social.linux.pizza"
          mastodon-active-user "Gamewarrior010")

;; Enable abbreviation mode
(add-hook 'text-mode-hook 'abbrev-mode)

;; (projectile-project-search-path '("~/Documents/School"))

(require 'go-translate)

(setq gts-translate-list '(("en" "zh")))

;; (setq gts-default-translator (gts-translator :engines (gts-bing-engine)))

(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-bing-engine) (gts-google-engine))
       :render (gts-buffer-render)))
