(setq phpplus-packages
      '(
        flycheck
        (company-php :depends company)
        php-mode
        ))

(defun phpplus/post-init-flycheck ()
  (spacemacs/enable-flycheck 'php-mode))

(defun phpplus/init-php-mode ()
  (use-package php-mode
    :defer t
    :mode ("\\.php\\'" . php-mode)))

(defun phpplus/init-company-php ()
  (use-package company-php
    :defer t
    :bind (:map php-mode-map
           ("C-]" . ac-php-find-symbol-at-point)
           ("C-t" . ac-php-location-stack-back))
    :init
    (progn
      (add-hook 'php-mode-hook  'ac-php-core-eldoc-setup)
      (spacemacs|add-company-backends
        :modes php-mode
        :variables
        company-minimum-prefix-length 0
        :backends (company-ac-php-backend company-dabbrev))
      )))
