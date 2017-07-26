;;; packages.el --- cabuda-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Du <duxinlong@B000000072964>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `cabuda-programming-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cabuda-programming/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cabuda-programming/pre-init-PACKAGE' and/or
;;   `cabuda-programming/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cabuda-programming-packages
  '(
    web-mode
    json-mode
    go-dlv
    )
  "The list of Lisp packages required by the cabuda-programming layer.")


;;; packages.el ends here

(defun cabuda-programming/post-init-web-mode ()
  (progn
    (setq-default
     ;; js2-mode
     js2-basic-offset 2
     ;; web-mode
     css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2)
    ))

(defun cabuda-programming/init-json-mode ()
  (use-package json-mode
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'json-mode
        "f" 'json-mode-beautify))))

(defun cabuda-programming/init-go-dlv ()
  (use-package go-dlv
    :defer t))
