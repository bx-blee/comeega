;;; comeega-poly-tex.el --- Blee Native Package: comeega-poly-tex  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)

(define-hostmode poly-latex-hostmode
  :mode 'latex-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode poly-org-comeega-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "[ \t]*#\\+begin_org.*\n"
  :tail-matcher "[ \t]*#\\+end_org.*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-latex-mode
  :hostmode 'poly-latex-hostmode
  :innermodes '(poly-org-comeega-innermode))

(add-to-list 'auto-mode-alist '("\\.tex\\'" . poly-latex-mode))

(provide 'comeega-poly-tex)
;;; comeega-poly-tex.el ends here
