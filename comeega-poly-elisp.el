;;; comeega-poly-elisp.el --- Blee Native Package: comeega-poly-elisp  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)
(require 'org)
(require 'org-src)

(define-hostmode comeega:poly-emacs-lisp-hostmode
  :mode 'emacs-lisp-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode comeega:poly-org-elisp-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "(orgCmntBegin.*\n"
  :tail-matcher "orgCmntEnd).*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode comeega:poly-emacs-lisp-mode
  :hostmode 'comeega:poly-emacs-lisp-hostmode
  :innermodes '(comeega:poly-org-elisp-innermode)
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

(add-to-list 'auto-mode-alist '("\\.el\\'" . comeega:poly-emacs-lisp-mode))

(provide 'comeega-poly-elisp)
;;; comeega-poly-elisp.el ends here
