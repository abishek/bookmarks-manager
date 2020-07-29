(in-package #:rad-user)
(define-module #:bookmarks-manager
    (:use #:cl #:radiance))

(define-trigger db:connected ()
  (progn
    (format nil "db connected")
    (db:create 'bookmarks '((url (:varchar 500))
                            (note (:varchar 9000))
                            (updated (:integer 5))))
    (db:create 'bookmark-tags '((tag (:varchar 200))
                                (bookmark :id)))))
