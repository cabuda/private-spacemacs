;; backup and auto-save files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(when (string-equal system-type "windows-nt")
  (setq default-directory (getenv "HOME"))
  (setq helm-locate-command "es %s -path %%HOME%% %s"))
