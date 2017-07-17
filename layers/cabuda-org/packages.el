;;; packages.el --- cabuda-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Du <duxinlong@B000000072964>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cabuda-org-packages
  '(
    deft
    org-journal
    )
  "The list of Lisp packages required by the cabuda-org layer.")

(defun cabuda-org/post-init-deft ()
  (progn
    (spacemacs/set-leader-keys-for-major-mode 'deft-mode "q" 'quit-window)
    (setq deft-default-extension "org")
    (setq deft-directory (expand-file-name "deft-notes" dotspacemacs-directory))
    ))

(defun cabuda-org/post-init-org-journal ()
  (progn
    (setq org-journal-dir (expand-file-name "journal-notes" dotspacemacs-directory))
    ))
