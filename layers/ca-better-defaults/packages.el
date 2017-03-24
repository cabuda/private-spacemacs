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
  '(chinese-fonts-setup
    google-translate
    engine-mode)
  "The list of Lisp packages required by the ca-better-defaults layer.")

(defun ca-better-defaults/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (chinese-fonts-setup-enable)
    (setq cfs--current-profile "profile1")
    (if (eq system-type 'darwin)
            (setq cfs--profiles-steps '(("profile1" . 5)))
            (setq cfs--profiles-steps '(("profile1" . 2))))
    ))

(defun ca-better-defaults/post-init-google-translate ()
  (progn
    (setq google-translate-default-target-language "zh-CN")))

(defun ca-better-defaults/pre-init-engine-mode ()
  (progn
    (setq custom-search-engine-alist '((baidu
                                        :name "baidu"
                                        :url "https://www.baidu.com/s?wd=%s")
                                       (baidu-family
                                        :name "baidu-family"
                                        :url "http://neisou.baidu.com/web/search?word=%s&tn=family_redirect&ds=family")))
    (dolist (engine custom-search-engine-alist)
      (let ((func (intern (format "engine/search-%S" (car engine)))))
        (autoload func "engine-mode" nil 'interactive)))
    ))
(defun ca-better-defaults/post-init-engine-mode ()
  (progn
    (dolist (engine custom-search-engine-alist)
      (let* ((cur-engine (car engine))
             (engine-url (plist-get (cdr engine) :url)))
        (eval `(defengine ,cur-engine ,engine-url))))
    (setq search-engine-alist (append search-engine-alist custom-search-engine-alist))
    ))
