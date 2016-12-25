;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     python
     asciidoc
     haskell
     erlang
     yaml
     markdown
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     emacs-lisp
     org
     docker
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell)
     spell-checking
     syntax-checking
     (restclient :variables
                 restclient-use-org t)
     version-control
     erc
     git
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;; org-mode
  (require 'ox-confluence)
  (with-eval-after-load 
      (require 'org-mac-iCal)
    (require 'ob-plantuml)
    (require 'ob-ditaa)
    ;;(require 'ox-jira)
    ;; redefining org mac iCal to support Exchange
    (defun org-mac-iCal ()
      "Selects checked calendars in iCal.app and imports them into
the the Emacs diary"
      (interactive)

      ;; kill diary buffers then empty diary files to avoid duplicates
      (setq currentBuffer (buffer-name))
      (setq openBuffers (mapcar (function buffer-name) (buffer-list)))
      (omi-kill-diary-buffer openBuffers)
      (with-temp-buffer
        (insert-file-contents diary-file)
        (delete-region (point-min) (point-max))
        (write-region (point-min) (point-max) diary-file))

      ;; determine available calendars
      (setq caldav-folders (directory-files "~/Library/Calendars" 1 ".*\\(caldav\\)\\|\\(exchange\\)$"))
      (setq caldav-calendars nil)
      (mapc
       (lambda (x)
         (setq caldav-calendars (nconc caldav-calendars (directory-files x 1 ".*calendar$"))))
       caldav-folders)

      (setq local-calendars nil)
      (setq local-calendars (directory-files "~/Library/Calendars" 1 ".*calendar$"))

      (setq all-calendars (append caldav-calendars local-calendars))

      ;; parse each calendar's Info.plist to see if calendar is checked in iCal
      (setq all-calendars (delq 'nil (mapcar
                                      (lambda (x)
                                        (omi-checked x))
                                      all-calendars)))

      ;; for each calendar, concatenate individual events into a single ics file
      (with-temp-buffer
        (shell-command "sw_vers" (current-buffer))
        (when (re-search-backward "10\\.[5678]" nil t)
          (omi-concat-leopard-ics all-calendars)))

      ;; move all caldav ics files to the same place as local ics files
      (mapc
       (lambda (x)
         (mapc
          (lambda (y)
            (rename-file (concat x "/" y);
                         (concat "~/Library/Calendars/" y)))
          (directory-files x nil ".*ics$")))
       caldav-folders)

      ;; check calendar has contents and import
      (setq import-calendars (directory-files "~/Library/Calendars" 1 ".*ics$"))
      (mapc
       (lambda (x)
         (when (/= (nth 7 (file-attributes x 'string)) 0)
           (omi-import-ics x)))
       import-calendars)

      ;; tidy up intermediate files and buffers
      (setq usedCalendarsBuffers (mapcar (function buffer-name) (buffer-list)))
      (omi-kill-ics-buffer usedCalendarsBuffers)
      (setq usedCalendarsFiles (directory-files "~/Library/Calendars" 1 ".*ics$"))
      (omi-delete-ics-file usedCalendarsFiles)

      (org-pop-to-buffer-same-window currentBuffer))

     ;; active Org-babel languages
     (org-babel-do-load-languages
      'org-babel-load-languages
      '(;; other Babel languages
        (emacs-lisp . t)
        (plantuml . t)
        (shell . t) 
        (http . t) 
        (ditaa . t)))

    (add-to-list
     'org-src-lang-modes '("plantuml" . puml))
    (setq org-plantuml-jar-path
          (expand-file-name "~/.emacs.d/elpa/contrib/scripts/plantuml.jar"))

    ;; Set to the name of the file where new notes will be stored
    (setq org-mobile-inbox-for-pull "~/notes/flagged.org")
    ;; Set to <your Dropbox root directory>/MobileOrg.
    (setq org-mobile-directory "~/Dropbox/MobileOrg")

    (define-key global-map "\C-ca" 'org-agenda)
    (setq org-log-done t)
    (setq org-directory "~/notes")
    (setq grydholt-as3-file (concat org-directory "/as3.org"))
    (setq grydholt-gtd-file (concat org-directory "/gtd.org"))
    (setq grydholt-notes-file (concat org-directory "/notes.org"))
    (setq grydholt-stress-file (concat org-directory "/stress.org"))
    (setq grydholt-privat-file (concat org-directory "/privat.org"))
    (setq grydholt-pes-file (concat org-directory "/pes.org"))
    (setq grydholt-current-file (concat org-directory "/current.org"))
    (setq grydholt-work-file (concat org-directory "/work-links.org"))
    (setq grydholt-task-dir (concat org-directory "/tasks"))
    (setq grydholt-jira-dir "~/.org-jira/")

    (setq org-agenda-files (list grydholt-gtd-file grydholt-pes-file grydholt-privat-file grydholt-notes-file grydholt-current-file grydholt-work-file grydholt-task-dir grydholt-jira-dir))

    (setq org-default-notes-file grydholt-notes-file)

    (setq jiralib-url "https://intranet.clcbio.com/jira")


    (setq org-refile-use-outline-path 'file)
    (setq org-refile-targets
          '((nil :maxlevel . 3)
            (org-agenda-files :maxlevel . 3)))

    (setq org-capture-templates
          '(("i" "Meetin" plain (file+regexp grydholt-as3-file "<<MEETING TIMES>>")
             "CLOCK: %U--" :immediate-finish t)
            ("o" "Clockin out" plain (file+regexp grydholt-as3-file "%u.*--")
             "%U")
            ("t" "Todo" entry (file+headline grydholt-gtd-file "Tasks")
             "* TODO %?\n  %i\n  %a")
            ("j" "Journal" entry (file+datetree grydholt-notes-file)
             "* %?\nEntered on %U\n  %i\n  %a")
            ("s" "Stress" table-line (file+headline grydholt-stress-file "Dagbog")
             "|--|
| %T | %^{Symptom} | %^{Årsag} | %^{Løsning} |")
            )
          )

    (defvar org-my-archive-expiry-days 3
      "The number of days after which a completed task should be auto-archived.
This can be 0 for immediate, or a floating point value.")

    (setq calendar-week-start-day 1)

    (setq org-agenda-custom-commands
          '(
            ("d" todo "DONE|DEFERRED|CANCELLED" nil)
            ("c" "Today" agenda ""
             ((org-agenda-ndays 1)          ;; agenda will start in day view
              (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
              (org-agenda-entry-types '(:scheduled :deadline))        ;; limits agenda view to scheduled items or items passed a deadline
              ))
            ("p" "Planning Today" agenda ""
             ((org-agenda-ndays 1)          ;; agenda will start in day view
              (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
              (org-agenda-view-columns-initially t) ;;
              (org-agenda-entry-types '(:scheduled))        ;; limits agenda view to scheduled items
              ))
            ("v" "Scheduled for tomorrow" agenda ""
             ((org-agenda-ndays 1)          ;; agenda will start in day view
              (org-agenda-start-day "+1d")
              (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
              (org-agenda-entry-types '(:scheduled :deadline))        ;; limits agenda view to scheduled items for tomorrow or items with deadline tomorrow
              ))
            ("k" "Overview of current" todo "STARTED"
             )
            ("I" "Import diary from iCal" agenda ""
             ((org-agenda-mode-hook
               (lambda ()
                 (org-mac-iCal)))))
            ))

    (add-hook 'org-mode-hook (lambda ()
                               (define-key org-mode-map (kbd "C-c m") 'org-mac-grab-link)))

    (setq org-link-abbrev-alist
          '(("jira" . "https://stibosystems.atlassian.net/browse/%s")))

    ;;(docker-machine-env "dev")
   )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(explicit-shell-file-name "/bin/bash")
 '(org-agenda-files
   (quote
    ("~/notes/gtd.org" "~/notes/pes.org" "~/notes/privat.org" "~/notes/notes.org" "~/notes/current.org" "~/notes/work-links.org" "/home/jgry/notes/tasks/datagathering.org" "/home/jgry/notes/tasks/geb.org" "/home/jgry/notes/tasks/hus.org" "/home/jgry/notes/tasks/julefrokost.org" "/home/jgry/notes/tasks/seqflow.org" "/home/jgry/notes/tasks/seqflow_architecture.org" "/home/jgry/notes/tasks/seqflow_architecture_roadmap.org" "/home/jgry/notes/tasks/usermanagement.org")))
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode cython-mode company-anaconda anaconda-mode pythonic adoc-mode markup-faces restclient ob-http flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell auto-dictionary company-web web-completion-data company-statistics company-cabal auto-yasnippet ac-ispell auto-complete intero flycheck hlint-refactor hindent haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode erlang erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks yaml-mode smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit mmm-mode markdown-toc markdown-mode gh-md dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat plantuml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter diff-hl vimrc-mode dactyl-mode pcache hide-comnt xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help org-projectile org-present org org-pomodoro alert log4e gntp org-download htmlize gnuplot ws-butler window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash async aggressive-indent adaptive-wrap ace-window ace-link avy quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )