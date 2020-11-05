(in-package #:bookmarks-manager)

(djula:add-template-directory (asdf:system-relative-pathname "bookmarks-manager" "template/"))
(defparameter +list.html+ (djula:compile-template* "list.html"))
(defparameter +add_or_edit.html+ (djula:compile-template* "add_or_edit.html"))

(defun index-html ()
  (let* ((bookmarks (get-all-bookmarks))
         (count (length bookmarks)))
    (djula:render-template* +list.html+ nil :bookmarks bookmarks :count count)))

(define-page add "bookmarks-manager/add" ()
  (let ((bookmark (dm:hull 'radiance-user::bookmarks)))
    (djula:render-template* +add_or_edit.html+ nil :bookmark (bookmark-to-list bookmark nil) :edit nil)))

(define-page edit "bookmarks-manager/edit/(.*)" (:uri-groups (id)) ()
  (let ((bookmark (ensure-bookmark id)))
    (djula:render-template* +add_or_edit.html+ nil :bookmark (bookmark-to-list bookmark nil) :edit t)))

(define-api bookmarks-manager/add (url note tags) ()
  (create-bookmark url note tags)
  (redirect #@"bookmarks-manager/home"))

(define-api bookmarks-manager/update (id url note tags) ()
  (update-bookmark id url note tags)
  (redirect #@"bookmarks-manager/home"))

(define-api bookmarks-manager/delete (id) ()
  (let ((bookmark (ensure-bookmark id)))
    (dm:delete bookmark)
    (redirect #@"bookmarks-manager/home")))

(define-page frontpage "bookmarks-manager/^$" ()
  (redirect #@"bookmarks-manager/home"))
