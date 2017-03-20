;;; packages.el --- ca-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Du <duxinlong@B000000072964>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ca-org-packages
  '(deft)
  "The list of Lisp packages required by the ca-org layer.")

(defun ca-org/post-init-deft ()
  (progn
    (spacemacs/set-leader-keys-for-major-mode 'deft-mode "q" 'quit-window)
    (setq deft-default-extension "org")
    (setq deft-directory (expand-file-name "deft-notes" dotspacemacs-directory))))
