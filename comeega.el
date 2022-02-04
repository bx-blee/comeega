;;; comeega.el --- Description   -*- Mode: Emacs-Lisp; lexical-binding: t; -*-
;;
;;
;;; Commentary:
;;
;;  COMEEGA (Collaborative Org-Mode Enhanced Emacs Generalized Authoring)
;;
;;; Code:

(require 'polymode)
(require 's)

(defvar comeega:modes:list
  (list
   'emacs-lisp-mode
   'python-mode
   'latex-mode
   'sh-mode
   'org-mode
   )
  "Currently supported valid major-modes.")

;;;
;;; (comeega:polymode|getForMode major-mode)
;;;
(defun comeega:polymode|getForMode (<major-mode)
  "Put 'current-buffer' into poly-native mode."
  (let* (
         ($major-mode-str (symbol-name <major-mode))
         ($polymodeAsStr (s-lex-format "comeega:poly-${$major-mode-str}"))
         ($polymodeAsSymbol (intern-soft $polymodeAsStr))
         )
    (unless $polymodeAsSymbol
      (error (s-lex-format
              "Missing symbol -- ${$polymodeAsStr}")))
    $polymodeAsSymbol))

(defun comeega:org/switch ()
  "Put 'current-buffer' into org mode."
  (interactive)
  (org-mode)
  (setq major-mode 'org-mode)
  (font-lock-ensure)
  )



(defun comeega:native/switch ()
  "Put into native mode."
  (interactive)
  (when polymode-mode      ;;; if-then
    (set-auto-mode))
  (unless polymode-mode    ;;; if-else
    (cond
     ((not (member major-mode comeega:modes:list))
      (error (s-lex-format
              "Usage Error: unsupported major-mode=${major-mode}"))
      )
     ((eq major-mode 'org-mode)
      (set-auto-mode)
      (org-indent-mode 0)
      (font-lock-fontify-buffer 1)
      )
     (t
      (set-auto-mode)
      (org-indent-mode 0)
      (font-lock-ensure)
      )
     )))


;;;
;;; (comeega:poly-native/switch)
;;;
(defun comeega:poly-native/switch ()
  "Put 'current-buffer' into poly-native mode."
  (interactive)
  (unless polymode-mode    ;;; Nothing will be done when polymode-mode
    (cond
     ((not (member major-mode comeega:modes:list))
      (error (s-lex-format
              "Usage Error: unsupported major-mode=${major-mode}"))
      )
     ((equal major-mode 'org-mode)
      (set-auto-mode)
      (call-interactively (comeega:polymode|getForMode major-mode))
      (current-buffer)
      (org-indent-mode 0)
      (font-lock-fontify-buffer 1)
      )
     (t
      (call-interactively (comeega:polymode|getForMode major-mode))
      (current-buffer)
      (org-indent-mode 0)
      (font-lock-fontify-buffer 1)
      (org-indent-mode 0)
      )
     )))

;;; (blee:comeega:globalKbd|set)
(defun blee:comeega:globalKbd|set ()
  "Put 'current-buffer' into poly-native mode."
  ;;; (define-key global-map [(f12)] nil)
  
  (define-key global-map [(f12) (o) ] 'comeega:org/switch)
  (define-key global-map [(f12) (n) ] 'comeega:native/switch)
  (define-key global-map [(f12) (p) ] 'comeega:poly-native/switch)
  )

;;; (blee:comeega:globalKbd|set)

(provide 'comeega)
;;; comeega.el ends here
