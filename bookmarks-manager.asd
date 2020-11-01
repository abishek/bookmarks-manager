(in-package #:cl-user)
(asdf:defsystem #:bookmarks-manager
  :components ((:file "bookmarks")
	       (:file "database"))
  :depends-on (:postmodern :hunchentoot :spinneret))
