(defun magit-push-to-gerrit ()
  (interactive)
  (magit-git-command-topdir (concat "git push origin HEAD:refs/for/" (magit-get-current-branch))))
