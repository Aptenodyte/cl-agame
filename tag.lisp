;; matt's first text adventure REPL

#|
We use this engine by copying the files and overwriting the values for now.
Eventually there may be a project creation wizard.
|#

(defparameter *base-prompt* "HAL-9000> "
  "*base-prompt* is used by the REPL as the default prompt"
  )

(defparameter *command-hash* () ; each key should match to a list of commands, a description of the command, and invocation instructions
  "a hash table of all the valid commands"
  )

(defparameter *command-list* '(("quit")("help"))
  "a list of all the valid commands"
  )

(defvar finished? nil ; this should eventually be done locally within my-shell
  "is the game over?"
  )

(defun my-shell ()
  "a custom REPL for the game"
  ;; read line
  ;; take commands
  ;; do something with them
  ;; loop
  (setf finished? nil)
  (princ *base-prompt*)
  (my-read-and-exec)
  (print finished?)
  (if (eql finished? nil)
      (my-shell)
      )
  )

#|
(defmacro eql-case (keyform &rest args) ; args should be a list, 
  "case branching with eql"
  `(cond ((eql ,keyform (nth 1 ,args)) (nth 2 ,args))
	 ))
|#

(defun my-read-and-exec ()
  "a custom READ command"
  (let ((my-input (read)))
    (cond ((equal my-input "help") (my-help)) ; this should eventually scan through a list of associated words for each command
	  ((equal my-input "quit") (my-quit))
	  (t (print "I don't understand")))
;    (princ my-input)
    )
  )

#|
    (case my-input
      ("help" (my-help)) ; this should automagically load from an alist or something - perhaps a hash key tied to a cons cell?
      ("quit" (my-quit)) ; the commands should all be lumped into a "logic" file. Add structure later, though.
      (otherwise (princ my-input)))
    )
  )
|#

; (princ "I don't understand")))

(defun my-help ()
  "provides help"
  ; for now, print a list of available commands. Make a dedicated cmd for this later.
  (princ "your available commands are:")
  (terpri)
  (princ "help")
  (terpri)
  (princ "quit")
  (terpri)
  )

(defun my-quit ()
  "kills the repl"
  ; for now
  (setf finished? t)
  )

#|
(defun my-eval (input)
  "do we really need a custom EVAL command?"
  (nil))
|#
; (defun my-loop)

(defun prompt ()
  "a default prompt"
  (princ "say something! > ")
  (let ((my-input (read)))
    (princ "you said:")
    (terpri)
    (princ my-input)))
