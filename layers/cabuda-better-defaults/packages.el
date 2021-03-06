;;; packages.el --- cabuda-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <cabud@DESKTOP-NG4P6LP>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cabuda-better-defaults-packages
  '(
    helm-swoop
    (recentf :location built-in)
    default-text-scale
    )
  "The list of Lisp packages required by the cabuda-better-defaults layer.")

(defun cabuda-better-defaults/post-init-helm-swoop ()
  (progn
    (bind-key "M-s /" 'helm-swoop)
    (bind-key "C-S-s" 'spacemacs/helm-swoop-region-or-symbol)))

(defun cabuda-better-defaults/post-init-recentf ()
  (progn
    (setq recentf-exclude
          '("COMMIT_MSG"
            "COMMIT_EDITMSG"
            "github.*txt$"
            "/tmp/"
            "/ssh:"
            "/sudo:"
            "/TAGS$"
            "/GTAGS$"
            "/GRAGS$"
            "/GPATH$"
            "\\.mkv$"
            "\\.mp[34]$"
            "\\.avi$"
            "\\.pdf$"
            "\\.sub$"
            "\\.srt$"
            "\\.ass$"
            ".*png$"
            ))
    (setq recentf-max-saved-items 2048)))

(defun cabuda-better-defaults/init-default-text-scale ()
  (use-package default-text-scale
    :bind (("C-M-=" . default-text-scale-increase)
           ("C-M--" . default-text-scale-decrease))))
