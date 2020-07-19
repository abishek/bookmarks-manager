(in-package #:rad-user)
(define-module #:bookmarks-manager
    (:use #:cl #:radiance))

(define-trigger db:connected ()
  (progn
    (format nil "db connected")
    (db:create 'bookmarks '((url (:varchar 500))
                            (updated (:integer 5))))))
