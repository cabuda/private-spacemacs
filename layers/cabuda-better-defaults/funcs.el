(defun magit-push-to-gerrit ()
  (interactive)
  (magit-git-command (concat "push origin HEAD:refs/for/" (magit-get-current-branch)) (magit-toplevel)))

(defun cabuda/rsync-to-dev_pc()
  "Sync code to dev_pc"
  (interactive)
  (start-process-shell-command
   "rsync_from_dev"
   (get-buffer-create "*rsync-buffer*")
   "rsync -avzP --delete --inplace --password-file=/Users/duxinlong/.config/rsync/rsyncd.secrets  /Users/duxinlong/codes/ rsync://duxinlong@cp01-rdqa-dev083-duxinlong.epc:8050/codes/")
  (message "已同步到开发机"))

(defun cabuda/rsync-from-dev_pc()
  "Sync code from dev_pc"
  (interactive)
  (start-process-shell-command
   "rsync_from_dev"
   (get-buffer-create "*rsync-buffer*")
   "rsync -avzP --delete --inplace --password-file=/Users/duxinlong/.config/rsync/rsyncd.secrets rsync://duxinlong@cp01-rdqa-dev083-duxinlong.epc:8050/codes/ /Users/duxinlong/codes/")
  (message "已同步到本地"))
