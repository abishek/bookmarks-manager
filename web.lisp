(in-package #:bookmarks-manager
	    (:use :spinneret :hunchentoot))

(defun start-server ()
  (hunchentoot:start (setf *acceptor*
			   (make-instance 'hunchentoot:easy-acceptor :port 8888))))

(defun stop-server ()
  (when *acceptor*
    (when hunchentoot:started-p *acceptor*
	  (hunchentoot:stop *acceptor))))

(defun index-html ()
  (spinneret:with-html
    (:doctype)
    (:html
     (:head
      (:title "Bookmarks Manager"))
     (:body
      (:header
       (:h1 "List of bookmarks"))
      (:section
       (:h4 "A table will appear here."))
      (:footer (:p "Its all open."))))))

(hunchentoot:define-easy-handler (index :uri "/") ()
  (setf (hunchentoot:content-type*) "text/json")
  (hunchentoot:with-html-output-to-string (*standard-output*)
    (index-html)))
