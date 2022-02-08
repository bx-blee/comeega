;;; comeega-poly-py.el --- Comeega-polymode for python-mode  -*- lexical-binding: t; -*-
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
;;  Comeega-polymode for python-mode enhanced with org-mode.
;;
;;  Inculsion of block comments in python is based on the native
;;  """Some Comment.""" feature.
;;
;;  Comeega-poly-python-org block-comment open tag is: "#+begin_org"
;;  Comeega-poly-python-org block-comment close tag is: "#+begin_org"
;;
;;  Comeega-poly-python-org doc-string open tag is: "#+begin_org"
;;  Comeega-poly-python-org doc-string close tag is: "#+end_org"
;;
;;  Smoke test file for this comeega-polymode is: [[file: ./examples/NOTYET ]]
;;
;;; Code:

(require 'polymode)
(require 'org)
(require 'org-src)

(define-hostmode comeega-poly-python-hostmode
  :mode 'python-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode comeega-poly-org-python-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "[ \t]*#\\+begin_org.*\n"
  :tail-matcher "[ \t]*#\\+end_org.*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode comeega-poly-python-lisp-mode
  :hostmode 'comeega-poly-python-hostmode
  :innermodes '(comeega-poly-org-python-innermode))

;; (add-to-list 'auto-mode-alist '("\\.py\\'" . poly-python-mode))

(provide 'comeega-poly-py)
;;; comeega-poly-py.el ends here
