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
    easy-hugo
    )
  "The list of Lisp packages required by the cabuda-org layer.")

(defun cabuda-org/post-init-deft ()
  (progn
    (spacemacs/set-leader-keys-for-major-mode 'deft-mode "q" 'quit-window)
    (setq deft-default-extension "org")
    (setq deft-directory (expand-file-name "deft-notes" sync-document-dir))
    ))

(defun cabuda-org/post-init-org-journal ()
  (progn
    (setq org-journal-dir (expand-file-name "journal-notes" sync-document-dir))
    ))

(defun cabuda-org/init-easy-hugo ()
  (use-package easy-hugo
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys "ah" 'easy-hugo))
    :config
    (progn
      (setq easy-hugo-basedir (expand-file-name "blog/" sync-document-dir)
            easy-hugo-url "https://cabuda.github.io"
            easy-hugo-postdir "content/post")
      (evil-set-initial-state 'easy-hugo-mode 'emacs)
      )))
