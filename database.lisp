(in-package #:bookmarks-manager)

;;; database related methods.

;; the list required to make a postmodern connection.
;; TODO: add this to env variables in the next iter
(defparameter connection-settings '("bookmarks" "bookmarksuser" "bookmarkspass" "localhost"))

(defun update-bookmark-and-return-id (id url note)
  (with-connection connection-settings
    (progn
      (query (:update 'bookmarks :set 'note note 'bookmark url :where (:= 'id id)))
      id)))

(defun insert-bookmark-and-return-id (url note)
  (with-connection connection-settings
    (query (:insert-into 'bookmarks :set 'note note 'bookmark url 'created (:current-timestamp) :returning 'id))))

(defun update-or-insert-bookmark-and-return-id (url note &optional (id nil))
  (if id
      (update-bookmark-and-return-id id url note)
      (insert-bookmark-and-return-id url note)))

(defun store-bookmark (url &optional (note nil) (id nil))
  "Save this data to the database."
  (update-or-insert-bookmark-and-return-id id url note))

(defun fetch-bookmark (id)
  "Fetch a bookmark given its id from the database."
    (with-connection connection-settings
      (query (:select '* :from 'bookmarks :where (:= 'id id)) :plist)))

(defun get-all-bookmarks ()
  "Fetch a list of bookmarks from the table."
  (with-connection connection-settings
    (query (:select '* :from 'bookmarks) :plists)))
