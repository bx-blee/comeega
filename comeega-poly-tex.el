;;; comeega-poly-tex.el --- Comeega-polymode for latex-mode  -*- lexical-binding: t; -*-
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
;;  Comeega-polymode for latex-mode enhanced with org-mode.
;;
;;  Inculsion of block comments in latex is based on the
;;  \usepackage{comment}
;;  \excludecomment{orgComment}
;;
;;  Comeega-poly-bash-org block-comment open tag is: "\begin{orgComment}"
;;  Comeega-poly-bash-org block-comment close tag is: "\end{orgComment}"
;;
;;  Comeega-poly-bash-org doc-string open tag is: N.A.
;;  Comeega-poly-bash-org doc-string close tag is: N.A.
;;
;;  Smoke test file for this comeega-polymode is: [[file: ./examples/NOTYET ]]
;;
;;; Code:

(require 'polymode)
(require 'org)
(require 'org-src)

(define-hostmode comeega-poly-latex-hostmode
  :mode 'latex-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode comeega-poly-org-latex-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "[ \t]*#\\+begin_org.*\n"
  :tail-matcher "[ \t]*#\\+end_org.*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode comeega-poly-latex-mode
  :hostmode 'comeega-poly-latex-hostmode
  :innermodes '(comeega-poly-org-latex-innermode))

;; (add-to-list 'auto-mode-alist '("\\.tex\\'" . poly-latex-mode))

(provide 'comeega-poly-tex)
;;; comeega-poly-tex.el ends here
