(defun synonyms (word list)
  "searches for appearance of WORD in a list of synonyms, returns the symbol associated with it."
  (assoc word list))

(defparameter *command-synonyms* 
  '((help . (commands cmds))
    (quit . (exit stop kill))
    )
  )

;; (defclass 