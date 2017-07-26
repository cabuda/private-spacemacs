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
    google-translate
    engine-mode
    youdao-dictionary
    fcitx
    magit
    yasnippet
    )
  "The list of Lisp packages required by the cabuda-better-defaults layer.")

(defun cabuda-better-defaults/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (chinese-fonts-setup-enable)
    (setq cfs--current-profile "profile1")
    (if (eq system-type 'darwin)
            (setq cfs--profiles-steps '(("profile1" . 5)))
            (setq cfs--profiles-steps '(("profile1" . 2))))
    ))

(defun cabuda-better-defaults/post-init-google-translate ()
  (progn
    (setq google-translate-default-target-language "zh-CN")))

(defun cabuda-better-defaults/pre-init-engine-mode ()
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
(defun cabuda-better-defaults/post-init-engine-mode ()
  (progn
    (dolist (engine custom-search-engine-alist)
      (let* ((cur-engine (car engine))
             (engine-url (plist-get (cdr engine) :url)))
        (eval `(defengine ,cur-engine ,engine-url))))
    (setq search-engine-alist (append search-engine-alist custom-search-engine-alist))
    ))


(defun cabuda-better-defaults/post-init-youdao-dictionary ()
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
  )

(defun cabuda-better-defaults/pre-init-fcitx ()
  (progn
    (setq fcitx-active-evil-states '(insert emacs hybrid))
    ))




(defun cabuda-better-defaults/post-init-magit ()
  (progn
    (with-eval-after-load 'magit
      (magit-define-popup-action 'magit-push-popup
        ?m
        "Push for code review"
        'magit-push-to-gerrit))))

(defun cabuda-better-defaults/post-init-yasnippet ()
  (progn
    (spacemacs/declare-prefix "os" "snippet")
    (spacemacs/set-leader-keys
      "osc" 'yas-new-snippet
      "ose" 'yas/visit-snippet-file)))
