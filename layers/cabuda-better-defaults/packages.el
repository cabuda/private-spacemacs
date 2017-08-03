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
    chinese-fonts-setup
    )
  "The list of Lisp packages required by the cabuda-better-defaults layer.")

(defun cabuda-better-defaults/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (cnfonts-enable)
    (setq cnfonts--current-profile "profile1")
    (if (eq system-type 'darwin)
            (setq cnfonts--profiles-steps '(("profile1" . 5)))
            (setq cnfonts--profiles-steps '(("profile1" . 2))))
    ))
