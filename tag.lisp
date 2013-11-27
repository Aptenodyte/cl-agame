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

(defparameter *shell-commands*  ;; an alist combining command name, 
  "commands for the shell"
  )

(defparameter *game-commands* "a path" ;;
  "commands for the game"
  )

(defparameter *command-list* '(("quit")("help"))
  "a list of all the valid commands" ; should eventually just point to the correct lists?
  )

(defparameter *command-do* '(("quit" . (my-quit))
			     ("help" . (my-help))
			     )
  )
; (defstruct command-do 


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

(defun my-parse (input valid-options) ; should implement a search of the list
  "checks if input is among the valid-options list"
  (loop for i
       from 0
       do (if (equal input (nth i valid-options)) 
	      (eval (assoc (nth i valid-options) *command-do*)))
       until (= i (1- (length valid-options)))
       )
  ;; match to synonym-list later
  )


(defun my-read-and-exec () ; may be split into read and execute functions
  "a custom read and execute command"
  (let ((my-input (read-line)))
    (cond ((equal my-input "help") (my-help)) ; this should eventually scan through a list of associated words for each command
	  ((equal my-input "quit") (my-quit))
	  (t (print "I don't understand")))
    )
  )

(defun my-help ()
  "provides help"
  ; for now, print a list of available commands. Make a dedicated cmd for this later.
  (princ "your available commands are:")
  (terpri)
  (loop for i
     from 0
     do (princ (nth i *command-list*))
     until (= i (1- (length *command-list*)))
       )
  )

(defun my-quit ()
  "kills the repl"
  ; for now
  (setf finished? t)
  )

(defun prompt ()
  "a default prompt"
  (princ "say something! > ")
  (let ((my-input (read)))
    (princ "you said:")
    (terpri)
    (princ my-input)))
