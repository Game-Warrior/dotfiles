;;    _____ __          __
;;  / ____| \ \        / / GameWarrior
;; | |  __   \ \  /\  / /  https://github.com/game-warrior
;; | | |_ |   \ \/  \/ /   @gamewarrior010@social.linux.pizza
;; | |__| |    \  /\  /    https://www.gnu.org/software/emacs/
;;  \_____|     \/  \/     https://:github.com/doomemacs/doomemacs
;;
;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! evil-tutor)
(package! tldr)
(package! org-tree-slide)
(package! org-auto-tangle)
(package! org-re-reveal)
(package! ox-twbs)
(package! calfw)
(package! calfw-org)
(package! dired-open)
(package! dired-subtree)
(package! peep-dired)
(package! emojify)
(package! beacon)
(package! rainbow-mode)
(package! resize-window)
(package! fountain-mode)
(package! wc-mode)
(package! ivy-posframe)
(package! yasnippet)
(package! palimpsest)
(package! emmet-mode)
(package! elfeed-goodies)
(package! mw-thesaurus)
(package! writeroom-mode)
(package! olivetti)
(package! org-ref)
(package! mastodon)
(package! ox-pandoc)
(package! pandoc)
(package! request)
(package! 2048-game)
(package! poetry)
(package! pretty-symbols)
(package! magit-todos)
(package! org-anki)
(package! anki-connect)
(package! ox-gfm)
(package! ivy-bibtex)
(package! anki-mode)
(package! go-translate)
(package! transient
      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
      :recipe (:host github :repo "magit/transient"))

(package! with-editor
          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
          :recipe (:host github :repo "magit/with-editor"))
(package! blamer)
(package! org-noter)
(package! nov.el)
(package! ox-epub)
(package! burly)
(package! eshell-prompt-extras)
(package! chatgpt-shell)
(package! dall-e-shell)
(package! ob-dall-e-shell)
(package! ob-chatgpt-shell)
(package! synosaurus)
(package! academic-phrases)
(package! pacmacs)
(package! fireplace)
(package! jinx)
(package! org-bullets)
(package! mood-line)
