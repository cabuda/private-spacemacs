(setq cabuda-ui-packages
      (append '(
                linum-relative
                ) cabuda-themes))

;; define programmatically the init functions
(dolist (pkg cabuda-themes)
  (eval `(defun ,(intern (format "cabuda-ui/init-%S" pkg)) nil)))

(defun cabuda-ui/post-init-linum-relative ()
  (linum-relative-on))
