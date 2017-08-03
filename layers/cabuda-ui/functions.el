(defun linum-on-inhibit-for-modes (orig-fun &rest args)
  (unless (member major-mode linum-mode-inhibit-modes-list)
    (apply orig-fun args)))
(advice-add 'linum-on :around #'linum-on-inhibit-for-modes)

