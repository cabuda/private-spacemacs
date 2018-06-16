(defun cabuda|rsync-to-dev_pc()
  "Sync code to dev_pc"
  (interactive)
  (start-process-shell-command
   "rsync_from_dev"
   (get-buffer-create "*rsync-buffer*")
   "rsync -avzP --delete --inplace --password-file=/Users/duxinlong/.config/rsync/rsyncd.secrets --exclude='.git/' /Users/duxinlong/codes/ rsync://duxinlong@cp01-rdqa-dev083-duxinlong.epc:8050/codes/")
  (message "已同步到开发机"))

(defun cabuda|rsync-from-dev_pc()
  "Sync code from dev_pc"
  (interactive)
  (start-process-shell-command
   "rsync_from_dev"
   (get-buffer-create "*rsync-buffer*")
   "rsync -avzP --delete --inplace --password-file=/Users/duxinlong/.config/rsync/rsyncd.secrets --exclude='.git/' rsync://duxinlong@cp01-rdqa-dev083-duxinlong.epc:8050/codes/ /Users/duxinlong/codes/")
  (message "已同步到本地"))

(defun cabuda|projectile-relative-path()
  "Get projectile relative path"
  (interactive)
  (let* ((fname (buffer-file-name))
         (root (or (projectile-project-root) "/"))
         (frname (file-relative-name fname root)))
    (if frname
        (message
         (kill-new
          (format "%s +%d" frname (count-lines 1 (point)))))
      (error "Get relative path fail"))))
