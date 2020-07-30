(in-package #:bookmarks-manager)

(defun create-bookmark (url note)
  (let ((bookmark (dm:hull 'radiance-user::bookmarks)))
    (setf (dm:field bookmark "url") url
          (dm:field bookmark "note") note
          (dm:field bookmark "updated") (get-universal-time))
    (dm:insert bookmark)))

(defun ensure-bookmark (bookmark)
  (typecase bookmark
    (db:id (or (dm:get-one 'radiance-user::bookmarks (db:query (:= '_id bookmark)))
               (error 'request-not-found :message (format nil "No bookmark with id ~a found." bookmark))))
    (t (ensure-bookmark (db:ensure-id bookmark)))))

(define-page index "bookmarks-manager/home" (:clip "main.ctml")
  (let* ((bookmarks (dm:get 'radiance-user::bookmarks (db:query :all)))
         (count (length bookmarks)))
    (l:info :message "listing ~a bookmarks" count)
    (r-clip:process T :bookmarks bookmarks :count count)))

(define-api bookmarks-manager/add (url note) ()
  (create-bookmark url note)
  (redirect (make-uri :domains '("bookmarks-manager")
                      :path "home")))

(define-api bookmarks-manager/delete (id) ()
  (let ((bookmark (ensure-bookmark id)))
    (dm:delete bookmark)
    (redirect (make-uri :domains '("bookmarks-manager")
                        :path "home"))))
