;;; comeega.el --- Org-mode Enhanced Authorship   -*- Mode: Emacs-Lisp; lexical-binding: t; -*-
;;
;; Copyright (C) 2021-2022 Mohsen BANAN - http://mohsen.1.banan.byname.net/contact
;;
;; Author: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Maintainer: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Created: February 03, 2022
;; Keywords: languages lisp
;; Homepage: https://github.com/bx-blee/comment-block
;; Package-Requires: ((emacs "25.1"))
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
;;  COMEEGA (Collaborative Org-Mode Enhanced Emacs Generalized Authoring)
;;  See https://github.com/bx-blee/comeega for a conceptual overview.
;;
;;  The major-mode for a given comeega-file can be switched between:
;;  1) native-mode      --- comeega:native/switch Command
;;  2) poly-native-mode --- comeega:poly-native/switch Command
;;  3) org-mode         --- comeega:org/switch Command
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
   'org-mode)
  "Currently supported valid major-modes.")

;;;
;;; (comeega:polymode|getForMode major-mode)
;;;
(defun comeega:polymode|getForMode (<major-mode)
  "Given <MAJOR-MODE, return corresponding polymode as a symbol.
Mapping between <MAJOR-MODE  and polymode is by prefixing it with 'comeega:poly-'"
  (let* (
         ($major-mode-str (symbol-name <major-mode))
         ($polymodeAsStr (s-lex-format "comeega:poly-${$major-mode-str}"))
         ($polymodeAsSymbol (intern-soft $polymodeAsStr)))
    (unless $polymodeAsSymbol
      (error (s-lex-format
              "Missing symbol -- ${$polymodeAsStr}")))
    $polymodeAsSymbol))

(defun comeega:org/switch ()
  "Put 'current-buffer' into org mode."
  (interactive)
  (org-mode)
  (setq major-mode 'org-mode)
  (font-lock-ensure))

(defun comeega:native/switch ()
  "Put 'current-buffer' into native mode.
Native mode is determined through 'set-auto-mode'."
  (interactive)
  (when polymode-mode      ;;; if-then
    (set-auto-mode))
  (unless polymode-mode    ;;; if-else
    (cond
     ((not (member major-mode comeega:modes:list))
      (error (s-lex-format
              "Usage Error: unsupported major-mode=${major-mode}")))
     ((eq major-mode 'org-mode) ;; in case it needs to be made specific.
      (set-auto-mode)
      (org-indent-mode 0)
      (font-lock-ensure))
     (t
      (set-auto-mode)
      (org-indent-mode 0)
      (font-lock-ensure)))))

;;;
;;; (comeega:poly-native/switch)
;;;
(defun comeega:poly-native/switch ()
  "Put 'current-buffer' into poly-native mode.
Native mode is determined through 'set-auto-mode'."
  (interactive)
  (unless polymode-mode    ;;; Nothing will be done when polymode-mode
    (cond
     ((not (member major-mode comeega:modes:list))
      (error (s-lex-format
              "Usage Error: unsupported major-mode=${major-mode}")))
     ((equal major-mode 'org-mode)
      (set-auto-mode)
      (call-interactively (comeega:polymode|getForMode major-mode))
      (current-buffer)
      (org-indent-mode 0)
      (font-lock-ensure))
     (t
      (call-interactively (comeega:polymode|getForMode major-mode))
      (current-buffer)
      (font-lock-ensure)
      (org-indent-mode 0)))))

;;; (blee:comeega:globalKbd|set)
(defun blee:comeega:globalKbd|set ()
  "Blee key-bindings. To be customized as needed."
  ;;; (define-key global-map [(f12)] nil)
  (define-key global-map [(f12) (o) ] 'comeega:org/switch)
  (define-key global-map [(f12) (n) ] 'comeega:native/switch)
  (define-key global-map [(f12) (p) ] 'comeega:poly-native/switch))

;;; (blee:comeega:globalKbd|set)

(provide 'comeega)
;;; comeega.el ends here
