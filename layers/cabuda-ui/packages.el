(setq cabuda-ui-packages
      (append '(
                ) cabuda-themes))

;; define programmatically the init functions
(dolist (pkg cabuda-themes)
  (eval `(defun ,(intern (format "cabuda-ui/init-%S" pkg)) nil)))
