;;; comeega-ex-bap.el --- Comeega-Example-BleeAdopyPackage  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Short Description: Global Activity: eaf --  mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
" orgCmntEnd)

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)

(orgCmntBegin "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
** TODO [#B] ====[[elisp:(org-cycle)][Fold]]==== Create A Panel For  [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][Panel Roadmap Documentation]]
**    https://github.com/manateelazycat/emacs-application-framework
**    https://www.emacswiki.org/emacs/EmacsApplicationFramework 
" orgCmntEnd)

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

