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
(package! dired-open)
(package! dired-subtree)
(package! peep-dired)
(package! emojify)
(package! rainbow-mode)
(package! resize-window)
(package! fountain-mode)
(package! wc-mode)
(package! ivy-posframe)
(package! yasnippet)
(package! palimpsest)
(package! emmet-mode)
(package! elfeed-goodies)
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
(package! ox-gfm)
(package! blamer)
(package! org-noter)
(package! nov.el)
(package! ox-epub)
(package! esxml)
(package! burly)
(package! eshell-prompt-extras)
(package! chatgpt-shell)
(package! synosaurus)
(package! academic-phrases)
(package! fireplace)
(package! jinx)
(package! org-bullets)
(package! fedi)
;; (package! lem)
(package! org-cliplink)
(package! ellama)
(package! org-timeblock)
;; (package! codeium :recipe (:host github :repo "Exafunction/codeium.el"))
(package! llm)
(package! sound-wav)
