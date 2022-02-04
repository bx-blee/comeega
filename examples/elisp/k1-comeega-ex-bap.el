;;; comeega-ex-bap.el --- Comeega-Example-BleeAdopyPackage  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Short Description: Global Activity: eaf --  mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-eaf.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
" orgCmntEnd)

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
** TODO [#B] ====[[elisp:(org-cycle)][Fold]]==== Create A Panel For  [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][Panel Roadmap Documentation]]
**    https://github.com/manateelazycat/emacs-application-framework
**    https://www.emacswiki.org/emacs/EmacsApplicationFramework 
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]* _Emacs Application Framework (EAF)_ |

")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:eaf:defaults-set -- Define 
")

(setq bap:eaf:usage:enabled-p t)


;;; (bap:eaf:full/update)
(defun bap:eaf:full/update () " #+begin_org
** Fully update this pkg.
#+end_org "
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:eaf:usage:enabled-p
    (bap:eaf:install/update)
    (bap:eaf:config/main)
    )
  )

(defun bap:eaf:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:eaf:install/update")

  (use-package eaf
    :load-path "/bisos/blee/extPkgs/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
    :custom
    (eaf-find-alternate-file-in-dired t)
    :config
    (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
    (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
    (eaf-bind-key take_photo "p" eaf-camera-keybinding)
    )
  )

;;;
;;; 
;;; (find-file-at-point "https://google.com")
;;; (find-file-at-point nil)
;;;


(defun blee:browse-url/dispatch (url &rest args)
  "Based on configuration parameters, decide which blee:browse-url functionality should be chosen
I
n Blee, you should assume (setq browse-url-browser-function 'blee:browse-url/dispatch)"
  (interactive)
  (save-window-excursion
    (eaf-open-browser url t)
    (make-frame (list '(height . 50) '(width . 105) ))
    )
  )

(defun bap:eaf:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    
  (message "blee:ann -- TMP -- bap:eaf:install/update")

  ;;;
  ;;; https://github.com/manateelazycat/emacs-application-framework/wiki/Customization
  ;;;
  ;;; http://www.neda.com  https://www.google.com


  ;;; eaf-open-mail-as-html in gnus

  (setq browse-url-browser-function 'blee:browse-url/dispatch)

  ;;; (setq browse-url-new-window-flag "newWindow")
  ;;; (setq browse-url-browser-function 'eaf-open-browser)
  ;;; (defalias 'browse-web #'eaf-open-browser)

  ;;; Dark Mode
  ;;(eaf-setq eaf-browser-dark-mode "true")
  ;;(eaf-setq eaf-pdf-dark-mode "true")
  ;;(eaf-setq eaf-mindmap-dark-mode "true")

  ;;; Disable Saving Browsing History

  ;;; The browsing history is automatically saved, by default. It is
  ;;; helpful for users to find a previous opened page using M-x
  ;;; eaf-open-browser-with-history. You can turn that off by
  
  ;; (eaf-setq eaf-browser-remember-history "false")

  ;;; Default Search Engine

  ;;; You can search for any string using M-x eaf-open-browser, M-x
  ;;; eaf-open-browser-with-history or M-x eaf-search-it. The default
  ;;; search engine used by EAF Browser is Google, as specified in the
  ;;; eaf-browser-default-search-engine variable. You can change it by

  ;; (setq eaf-browser-default-search-engine 'duckduckgo)

  ;;; Default “Blank” Page

  ;;; The default blank page is https://www.google.com, it is opened by (eaf-proxy-new_blank_page) by default.
  ;;; You can configure it by

  ;; (eaf-setq eaf-browse-blank-page-url "https://duckduckgo.com")


  ;;; Default Zoom

  ;;; Default zoom of EAF Browser is 1.0, you can set the default zoom by

  ;; (eaf-setq eaf-browser-default-zoom "1.25")

  ;;; Disable JavaScript

  ;;; For reasons, some people may prefer to disable JavaScript for
  ;;; the EAF Browser. The option has been provided.

  ;; (eaf-setq eaf-browser-enable-plugin "false")
  ;; (eaf-setq eaf-browser-enable-javascript "false")

  ;;; We don’t recommend it, you will lose a lot of features that EAF Browser provided.

  
  ;;; EAF Camera

  ;;; The default directory to store images taken by EAF Camera is ~/Downloads. You can change it like this.

  ;; (eaf-setq eaf-camera-save-path "new/path/")
  )

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-eaf)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

