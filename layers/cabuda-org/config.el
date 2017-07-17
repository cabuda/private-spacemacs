(setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

(defvar deft-dir ""
  "deft org files location")

(defvar journal-dir ""
  "org journal files location")

(setq-default
 deft-dir (expand-file-name "deft-notes" dotspacemacs-directory)
 journal-dir (expand-file-name "journal-notes" dotspacemacs-directory))
