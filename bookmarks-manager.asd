(in-package #:cl-user)
(asdf:defsystem #:bookmarks-manager
  :components ((:file "bookmarks")
	       (:file "database")
	       (:file "web"))
  :depends-on (:postmodern :hunchentoot :djula))
