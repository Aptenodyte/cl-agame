; DO NOT COMPILE THIS FILE
;; this is a place for junk functions, macros, and data-structures to be stored temporarily.

; if they prove a foundation for something useful, they may be removed and put back into circulation. Otherwise, they're here for documentation only.


(defmacro eql-case (keyform &rest args) ; args should be a list, 
  "case branching with eql"
  `(cond ((eql ,keyform (nth 1 ,args)) (nth 2 ,args))
	 ))

    (case my-input
      ("help" (my-help)) ; this should automagically load from an alist or something - perhaps a hash key tied to a cons cell?
      ("quit" (my-quit)) ; the commands should all be lumped into a "logic" file. Add structure later, though.
      (otherwise (princ my-input)))
    )
  )


; (princ "I don't understand")))


(defun my-exec (input)
  "executes a command based on the input"
  (nil))

; (defun my-loop)