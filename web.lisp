(in-package #:bookmarks-manager)

(setf hunchentoot:*dispatch-table*
      `(hunchentoot:dispatch-easy-handlers
	,(hunchentoot:create-folder-dispatcher-and-handler "/static/" "static/")))

(defun start-server ()
  (hunchentoot:start (setf hunchentoot:*acceptor*
			   (make-instance 'hunchentoot:easy-acceptor :port 8888))))

(defun stop-server ()
  (when hunchentoot:*acceptor*
    (when (hunchentoot:started-p hunchentoot:*acceptor*)
	  (hunchentoot:stop hunchentoot:*acceptor*))))

(hunchentoot:define-easy-handler (index :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")
  (index-html))
