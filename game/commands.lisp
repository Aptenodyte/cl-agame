

(defparameter *command-list* '(help quit))

(defgeneric command (command-name))
;; command functions take a function from the command list
;; and execute it

#| ;; gotta get cross-file interoperability working
(defmethod command (help)
  (my-help))

(defmethod command (quit)
  (my-quit))
|# 

;; (defclass 