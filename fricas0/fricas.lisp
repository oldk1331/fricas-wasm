(in-package :boot)
(setq |$spadroot| ".")
(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")
(defvar |$build_version| "Common Lisp - 1.3.13")
(defvar |$build_date| "Thu Mar 5 2026")
(defvar |$lisp_id_string| (concatenate 'string (lisp-implementation-type) " " (lisp-implementation-version)))

#+:SBCL
(fricas-lisp::set-initial-parameters) ;; this is skipped in fricas-lisp.lisp, why?

(defun gcmsg (x))

(defun |load_quietly| (f))

;;; init
(|interpsysInitialization| t)

(setq |$has_category_hash| (make-hash-table :test #'equal))
(setq |$operation_hash| (make-hash-table))


 (|open_interp_db| t)
 (|open_category_db| t)
 (|open_operation_db| t)
 (|open_browse_db| t)


(let ((*debugger-hook*
            (lambda (condition previous-handler)
                (|spad_system_error_handler| condition))
       ))
     (handler-bind ((error #'|spad_system_error_handler|))
       (|spad|)))
