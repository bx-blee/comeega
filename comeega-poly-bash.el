;;; comeega-poly-bash.el --- Comeega-polymode for sh-mode  -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021-2022 Mohsen BANAN - http://mohsen.1.banan.byname.net/contact
;;
;; Author: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Maintainer: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Created: February 03, 2022
;; Keywords: languages lisp
;; Homepage: https://github.com/bx-blee/comment-block
;; Package-Requires: ((emacs "26.1"))
;; Package-Version: 0.1
;;
;; This file is not part of GNU Emacs.
;; This file is part of Blee (ByStar Libre-Halaal Emacs Environment).
;;
;; This is Libre-Halaal Software intended to perpetually remain Libre-Halaal.
;; See http://mohsen.1.banan.byname.net/PLPC/120033 for details.
;; _Copyleft_: GNU AFFERO GENERAL PUBLIC LICENSE --- [[file:../LICENSE]]
;;
;;; Commentary:
;;
;;  Comeega-polymode for sh-mode enhanced with org-mode.
;;
;;  Inculsion of block comments in bash is based on the
;;  _CommentBegin_ and _CommentEnd_ alias. As:
;;  alias _CommentBegin_=': <<'\''_CommentEnd_'\'''
;;
;;  Comeega-poly-bash-org block-comment open tag is: "_CommentBegin_"
;;  Comeega-poly-bash-org block-comment close tag is: "_CommentEnd_"
;;
;;  Comeega-poly-bash-org doc-string open tag is: "_EOOB_ #+begin_org"
;;  Comeega-poly-bash-org doc-string close tag is: "^_EOOB_"
;;
;;  Smoke test file for this comeega-polymode is: [[file: ./examples/NOTYET ]]
;;
;;; Code:

(require 'polymode)
(require 'org)
(require 'org-src)

(define-hostmode comeega-poly-bash-hostmode
  :mode 'sh-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode comeega-poly-org-bash-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "[ \t]*#\\+begin_org.*\n"
  :tail-matcher "[ \t]*#\\+end_org.*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode comeega-poly-bash-mode
  :hostmode 'comeega-poly-bash-hostmode
  :innermodes '(comeega-poly-org-bash-innermode))

;; (add-to-list 'auto-mode-alist '("\\.sh\\'" . poly-bash-mode))

(provide 'comeega-poly-bash)
;;; comeega-poly-bash.el ends here
