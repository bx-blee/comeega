;;; comeega-poly-py.el --- Blee Native Package: comeega-poly-py  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)
(require 'org)
(require 'org-src)


(define-hostmode poly-python-hostmode
  :mode 'python-mode
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

(define-polymode poly-python-mode
  :hostmode 'poly-python-hostmode
  :innermodes '(poly-org-comeega-innermode)
  (setq-local org-src-fontify-natively nil)
  (setq-local polymode-move-these-minor-modes-from-old-buffer
              (append '(org-indent-mode)
                      polymode-move-these-minor-modes-from-old-buffer))
  (setq-local polymode-run-these-before-change-functions-in-other-buffers
              (append '(org-before-change-function
                        org-element--cache-before-change
                        org-table-remove-rectangle-highlight)
                      polymode-run-these-before-change-functions-in-other-buffers))
  (setq-local polymode-run-these-after-change-functions-in-other-buffers
              (append '(org-element--cache-after-change)
                      polymode-run-these-after-change-functions-in-other-buffers)))


(add-to-list 'auto-mode-alist '("\\.py\\'" . poly-python-mode))

(provide 'comeega-poly-py)
;;; comeega-poly-py.el ends here
