;;; packages.el --- ca-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <cabud@DESKTOP-NG4P6LP>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ca-better-defaults-packages
  '(chinese-fonts-setup)
  "The list of Lisp packages required by the ca-better-defaults layer.")

(defun ca-better-defaults/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (chinese-fonts-setup-enable)))
