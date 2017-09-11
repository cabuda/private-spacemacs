;;; packages.el --- cabuda-misc layer packages file for Spacemacs.
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
;; added to `cabuda-misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cabuda-misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cabuda-misc/pre-init-PACKAGE' and/or
;;   `cabuda-misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cabuda-misc-packages
  '(
    google-translate
    engine-mode
    youdao-dictionary
    fcitx
    magit
    yasnippet
    popup-kill-ring
    )
  "The list of Lisp packages required by the cabuda-misc layer.")


;;; packages.el ends here
(defun cabuda-misc/post-init-google-translate ()
  (progn
    (setq google-translate-default-target-language "zh-CN")))

(defun cabuda-misc/pre-init-engine-mode ()
  (progn
    (setq custom-search-engine-alist '((baidu
                                        :name "baidu"
                                        :url "https://www.baidu.com/s?wd=%s")
                                       (baidu-family
                                        :name "baidu-family"
                                        :url "http://neisou.baidu.com/web/search?word=%s&tn=family_redirect&ds=family")))
    (dolist (engine custom-search-engine-alist)
      (let ((func (intern (format "engine/search-%S" (car engine)))))
        (autoload func "engine-mode" nil 'interactive)))))
(defun cabuda-misc/post-init-engine-mode ()
  (progn
    (dolist (engine custom-search-engine-alist)
      (let* ((cur-engine (car engine))
             (engine-url (plist-get (cdr engine) :url)))
        (eval `(defengine ,cur-engine ,engine-url))))
    (setq search-engine-alist (append search-engine-alist custom-search-engine-alist))))


(defun cabuda-misc/post-init-youdao-dictionary ()
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+))

(defun cabuda-misc/pre-init-fcitx ()
  (progn
    (setq fcitx-active-evil-states '(insert emacs hybrid))))

(defun cabuda-misc/post-init-magit ()
  (progn
    (with-eval-after-load 'magit
      (magit-define-popup-action 'magit-push-popup
        ?m
        "Push for code review"
        'magit-push-to-gerrit))))

(defun cabuda-misc/post-init-yasnippet ()
  (progn
    (spacemacs/declare-prefix "os" "snippet")
    (spacemacs/set-leader-keys
      "osc" 'yas-new-snippet
      "ose" 'yas/visit-snippet-file)))

(defun cabuda-misc/init-popup-kill-ring ()
  (use-package popup-kill-ring
    :bind (:map global-map
           ("M-y" . popup-kill-ring))
     ))
