(defun magit-push-to-gerrit ()
  (interactive)
  (magit-git-command (concat "push origin HEAD:refs/for/" (magit-get-current-branch)) (magit-toplevel)))
