(in-package #:bookmarks-manager)

(setq hunchentoot:*dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'redirect-to-list)
       (create-regex-dispatcher "^/list$" 'list-bookmarks)
       (create-regex-dispatcher "^/new" 'new-bookmark)
       (create-regex-dispatcher "^/edit/[0-9]+$" 'update-bookmark)
       (create-regex-dispatcher "^/save$" 'save-bookmark)
       (create-regex-dispatcher "^/delete/[0-9]+$" 'delete-bookmark)
       (create-regex-dispatcher "^/search$" 'search-bookmarks)
       (create-folder-dispatcher-and-handler "/static/" "static/")))
					    
       
(defun start-server ()
  (hunchentoot:start (setf hunchentoot:*acceptor*
			   (make-instance 'hunchentoot:easy-acceptor :port 8888))))

(defun stop-server ()
  (when hunchentoot:*acceptor*
    (when (hunchentoot:started-p hunchentoot:*acceptor*)
	  (hunchentoot:stop hunchentoot:*acceptor*))))

(defun redirect-to-list ()
  (redirect "/list"))

(defun get-id-from-uri ()
  "Returns the ID from the URI request."
  (car (cl-ppcre:all-matches-as-strings "[0-9]+" (request-uri *request*))))
