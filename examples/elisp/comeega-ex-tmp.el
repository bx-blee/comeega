;;; example-comeega.el --- Blee Native Package: poly-elisp-comeega  -*- Mode: Emacs-Lisp; lexical-binding: t; -*-
;; (setq debug-on-error t)
;; (set-auto-mode)
;; (org-indent-mode 0)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () " #+begin_org
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
#+end_org ")
;;;#+END:

(lambda () " #+begin_org
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
#+end_org ")


(lambda () " #+begin_org {
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
} #+end_org ")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-comeega"
(lambda () " #+begin_org {
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message blee-comeega [[elisp:(org-cycle)][| ]]
} #+end_org ")

(message "blee-comeega")
;;;#+END:

(lambda () " #+begin_org {
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
} #+end_org ")

(require 'f)

(lambda () " #+begin_org {
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: blee:blee-comeega:all-defaults-set [[elisp:(org-cycle)][| ]]
(insert (format "%s" (set-auto-mode)))
(insert (format "%s" major-mode))
(insert (format "%s" polymode-mode))


} #+end_org ")


(lambda () " #+begin_org {
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee-comeega:all-defaults-set) [[elisp:(org-cycle)][| ]]
} #+end_org ")

(defun blee-comeega:all-defaults-set () " #+begin_org {
** Docstring Example.
} #+end_org "
  (interactive)

  (require 'blee-menu-ipAddr)
  (require 'blee-menu-domain)
  (require 'blee-checklist-vmHosts)

  ;;(blee:visitFilesMenuDef)  ;; Should not be initialized before (set-buffer "*LSIP* localhost")
  )


;;;   (blee:menu-sel:comeega:vc/define)
;;;
(defun blee:menu-sel:comeega:vc/define ()
  "Facilities that help consistently maintain and update blee panels"
  (interactive)
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define 
      blee:menu-sel:comeega:vc:menu
      nil 
      "Version Control Menu"
      `("Version Control Menu"
	"---"
	["Magit" magit t]
	["CVS Update" (cvs-update "." t) t]	
	"---"	
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    )
  )

(defun blee:menu-sel:comeega:vc|popupMenu ()
  ""
  (blee:menu-sel:comeega:vc/define)
  (popup-menu blee:menu-sel:comeega:vc:menu)
  )



(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:menu-sel:navigation:popupMenu)][Popup Org Navigation Menu]] | 
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:navigation:define) [[elisp:(org-cycle)][| ]]
  ")

;;;   (blee:menu-sel:comeega:maintenance:define)
;;;
(defun blee:menu-sel:comeega:maintenance:define ()
  "Facilities that help consistently maintain and update blee panels"
  (interactive)
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define 
      blee:menu-sel:comeega:maintenance:menu
      nil 
      "Maintenance Menu"
      `("Maintenance Menu"
	"---"
	["Replace Button Front Controls" blee:comeega:panel:modernize t]
	["Replace Menu Front Controls" blee:comeega:panel:menuModernize t]	
	"---"	
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:navigation:popupMenu) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:comeega:maintenance:popupMenu ()
  ""
  (blee:menu-sel:comeega:maintenance:define)
  (popup-menu blee:menu-sel:comeega:maintenance:menu)
  )


(lambda () "
*      Support Functions          ::   | 
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:navigation:popupMenu) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:comeega:panel:modernize ()
  "The initial space deletion is by design"
  (interactive)
  (save-excursion 
    (goto-char (point-min))
    (replace-string
     " [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]"
     "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
     )
    (goto-char (point-min))
    (replace-string
     " [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(delete-other-windows)][|1]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]]"
     "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(blee:menu-sel:outline:popupMenu)][||F]] [[elisp:(blee:menu-sel:navigation:popupMenu)][||M]]"
     )
    (goto-char (point-min))
    (replace-string
     " [[elisp:(beginning-of-buffer)][|^]] ==================== [[elisp:(delete-other-windows)][|1]]"
     "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] ======"
     )
    (goto-char (point-min))
    (replace-string
     " [[elisp:(beginning-of-buffer)][|^]] #################### [[elisp:(delete-other-windows)][|1]]"
     "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] ######"
     )
    )
  )

(defun blee:comeega:panel:menuModernize ()
  "The initial space deletion is by design"
  (interactive)
  (save-excursion 
    (goto-char (point-min))
    (replace-string
     "[[elisp:(blee:menu-sel:outline:popupMenu)][||F]]"
     "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]]"
     )
    (goto-char (point-min))
    (replace-string
     "[[elisp:(blee:menu-sel:navigation:popupMenu)][||M]]"
     "[[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
     )
    )
  )



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-comeega"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-comeega)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
