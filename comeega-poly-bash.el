;;; comeega-poly-bash.el --- Blee Native Package: comeega-poly-bash  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)

(define-hostmode poly-bash-hostmode
  :mode 'bash-mode
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

(define-polymode poly-bash-mode
  :hostmode 'poly-bash-hostmode
  :innermodes '(poly-org-comeega-innermode))

(add-to-list 'auto-mode-alist '("\\.sh\\'" . poly-bash-mode))

(provide 'comeega-poly-bash)
;;; comeega-poly-bash.el ends here
